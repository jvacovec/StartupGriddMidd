require 'google/api_client'
require 'launchy'
require 'json'

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
      Rake::Task["import:auth"].invoke
      authorization = storage.authorize
    end
    client = Google::APIClient.new(:application_name => 'StartupGrid',
      :application_version => '1.0.0')
    client.authorization = authorization
    # Could further optimize to cache the discovery file
    drive = client.discovered_api('drive', 'v2')

    result = client.execute(
      :api_method => drive.files.get,
      :parameters => {:fileId => CURATION_FORM_GOOGLE_DRIVE_ID}
    )
    if result.status == 200 and result.data?
      file = result.data
      # could check metadata to see if file has been updated since last check
      puts file.export_links
      # result = client.execute(uri: file.export_links)
      # if result.status == 200 and result.data?
      #   body = result.body

      # end
    else
      raise "Google Drive API responded with an invalid status code or did not provide data."
    end
  end
end
