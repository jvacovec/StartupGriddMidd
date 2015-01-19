require 'google/api_client'
require 'launchy'
require 'json'
require 'csv'
require 'date'

CURATION_FORM_GOOGLE_DRIVE_ID = '1w-MM5Be-vl7hewa9b0F_dCKmEygmwuQ3PoqCa4Ewi38'

class PGCredentialStore
  def initialize(model)
    @model= model
  end
  def load_credentials
    gc = GoogleCredential.first
    if gc && gc.credentials
      JSON.parse(gc.credentials)
    else
      nil
    end
  end
  def write_credentials(credentials_hash)
    gc = GoogleCredential.first
    if gc
      gc.credentials = credentials_hash.to_json
      gc.save
    else
      gc = GoogleCredential.create credentials: credentials_hash.to_json
    end
  end
end

namespace :import do
  desc "Authenticate with Google Drive in preparation for the data import."
  task auth: [:environment] do
    store = PGCredentialStore.new(GoogleCredential)
    storage = Google::APIClient::Storage.new(store)
    if not storage.authorize
      client_secrets = Google::APIClient::ClientSecrets.load 'config'
      authorization = client_secrets.to_authorization
      authorization.update!(
        :scope => 'https://www.googleapis.com/auth/drive.readonly',
        :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob'
      )
      auth_uri = authorization.authorization_uri.to_s
      $stdout.puts "Open this url in your browser to authenticate with Google:"
      $stdout.puts auth_uri.colorize(:blue)
      $stdout.write  "Enter authorization code: "
      authorization.code = $stdin.gets.chomp
      authorization.fetch_access_token!
      storage.write_credentials authorization
    end
  end

  desc "Download the Google Spreadsheet data as as .xsl file and import its contents to the db."
  task run: [:environment] do
    store = PGCredentialStore.new(GoogleCredential)
    storage = Google::APIClient::Storage.new(store)
    authorization = storage.authorize
    # Authorize if not authorized
    if not authorization
      raise "To import from Google Drive you must first run the authorization task ('rake import:auth')."
    end
    client = Google::APIClient.new(:application_name => 'StartupGrid',
      :application_version => '1.0.0')
    client.authorization = authorization

    # The client goes out and downloads the discovery file 
    # everytime this is run, so we could optimize by caching down the line.
    drive = client.discovered_api('drive', 'v2')

    # Download file metadata
    result = client.execute(
      :api_method => drive.files.get,
      :parameters => {:fileId => CURATION_FORM_GOOGLE_DRIVE_ID}
    )
    if result.status == 200 and result.data?
      dl_url = result.data['export_links']['application/pdf'].sub!('=pdf', '=csv')
      result = client.execute(uri: dl_url)
      if result.status == 200
        posts = Post.where.not(csv_row: nil).order(csv_row: :asc)
        table = CSV.parse(result.body, headers: true)
        table.each_with_index do |row, index|
          # If the corresponding row exists in the db
          if index < posts.length and posts[index].csv_row == index
            post = posts[index]
          else
            post = Post.new
          end
          $stdout.puts row.fetch('Timestamp').strip
          post.created_at = DateTime.parse row.fetch('Timestamp').strip
          # TODO: see if the column heading hash keys can be trimmed
          post.title = row.fetch('Title of Multimedia Entry ').strip
          post.date_posted = DateTime.parse row.fetch('Date Published ').strip
          post.url = row.fetch('Enter URL ').strip
          post.media_type = row.fetch('Type of Multimedia ').strip

          post.quote_1 = (row.fetch('Money Quote 1') || "").strip
          post.quote_2 = (row.fetch('Money Quote 2') || "").strip
          post.technicality = row.fetch('Technicality Rating ').to_i
          post.difficulty = row.fetch('Difficulty Rating ').to_i
          post.quality = row.fetch('Overall Rating').to_i
          post.summary = row.fetch('Give a quick summary of Insights gained').strip

          post.trackback_url_1 = (row.fetch('Other Source 1') || "").strip
          post.trackback_url_2 = (row.fetch('Other Source 2') || "").strip
          post.trackback_url_3 = (row.fetch('Other Source 3') || "").strip
          post.reference_url_1 = (row.fetch('Source to alternative media sources in entry ') || "").strip
          post.reference_url_2 = (row.fetch('Alternative Source 2') || "").strip
          post.user = User.find_by(username: row.fetch('Reviewer ID').strip.downcase)
          post.author = Author.find_or_create_by(name: row.fetch('Full Name of Multimedia Author  ').strip)

          post.save
          
          subtopics = row.fetch('Enter Subtopics (Min 1, Max 4)') || ""
          subtopics = subtopics.split(',').map{|t| t.strip.downcase}.select {|t| t.length > 0}
          subtopics.each do |tag_name|
            tag = Tag.find_by(name: tag_name)
            if not tag
              tag = Tag.create(name: tag_name, custom: true)
            end
            post.taggings.create(tag: tag)
          end
          tags = row.fetch('Enter Tags (Min 2, Max 6)') || ""
          tags = tags.split(',').map {|t| t.strip.downcase}.select {|t| t.length > 0}
          tags.each do |tag_name|
            tag = Tag.find_by(name: tag_name)
            if not tag
              tag = Tag.create(name: tag_name, custom: true)
            end
            post.taggings.create(tag: tag)
          end

          question_1 = row[10]
          if question_1
            question_1 = Question.find_or_create_by(question: question_1.strip)
            answer_1 = Answer.find_or_initialize_by(question: question_1, post: post)
            if post.media_type == 'Blog'
              answer_1.start_excerpt = (row[11] || "").strip
              answer_1.end_excerpt = (row[12] || "").strip
              answer_1.confidence = (row[13] || "").to_i
            elsif post.media_type == 'Video/Audio'
              answer_1.video_seek_time = (row[11] || "").to_i
            elsif post.media_type == 'Slideshare'
              answer_1.deck_start_slide = (row[11] || "").to_i
            end
            answer_1.save
          end

          question_2 = row[14]
          if question_2
            question_2 = Question.find_or_create_by(question: question_2.strip)
            answer_2 = Answer.find_or_initialize_by(question: question_2, post: post)
            if post.media_type == 'Blog'
              answer_2.start_excerpt = (row[19] || "").strip 
              # TODO: I'm guessing that columns 19 and 20 correspond to the start and end of question 2.
              answer_2.end_excerpt = (row[20] || "").strip
              answer_2.confidence = (row[15] || "").to_i
            elsif post.media_type == 'Video/Audio'
              answer_2.video_seek_time = (row[19] || "").to_i
            elsif post.media_type == 'Slideshare'
              answer_2.deck_start_slide = (row[19] || "").to_i
            end
            answer_2.save
          end

          question_3 = row[18]
          if question_3
            question_3 = Question.find_or_create_by(question: question_3.strip)
            answer_3 = Answer.find_or_initialize_by(question: question_3, post: post)
            if post.media_type == 'Blog'
              answer_3.start_excerpt = (row[21] || "").strip 
              # TODO: I'm guessing that columns 19 and 20 correspond to the start and end of question 2.
              answer_3.end_excerpt = (row[22] || "").strip
              answer_3.confidence = (row[17] || "").to_i
            elsif post.media_type == 'Video/Audio'
              answer_3.video_seek_time = (row[21] || "").to_i
            elsif post.media_type == 'Slideshare'
              answer_3.deck_start_slide = (row[21] || "").to_i
            end
            answer_3.save
          end
        end
      else
        raise "Could not download Google Spreadsheet CSV."
      end
    else
      raise "Google Drive API responded with an invalid status code or did not provide data."
    end
  end
end
