namespace :elastic_search do
  desc "Configuring Elastic Search"
  task create: [:environment] do
    Answer.__elasticsearch__.create_index! force: true
    Author.__elasticsearch__.create_index! force: true
    Post.__elasticsearch__.create_index! force: true
    Question.__elasticsearch__.create_index! force: true
    Tag.__elasticsearch__.create_index! force: true
    User.__elasticsearch__.create_index! force: true
  end
  desc "Import data into elastic search"
  task import: [:environment] do 
    Answer.import
    Author.import
    Post.import
    Question.import
    Tag.import
    User.import
  end
end
