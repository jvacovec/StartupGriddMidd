namespace :elastic_search do
  desc "Configuring Elastic Search"
  task create: [:environment] do
    Post.__elasticsearch__.create_index! force: true
  end
  desc "Import data into elastic search"
  task import: [:environment] do 
    Post.import
  end
end
