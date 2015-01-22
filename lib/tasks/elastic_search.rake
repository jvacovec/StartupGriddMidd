namespace :import do
  desc "Updating author bios and images"
  task elasticsearch: [:environment] do
    Answer.import
    Author.import
    Post.import
    Question.import
    Tag.import
    User.import
  end
end
