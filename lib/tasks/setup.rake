namespace :setup do

  task :migrate, [:environment] do
    Rake::Task["db:migrate"].invoke
  end
  task :search, [:environment] do
    Rake::Task["elastic_search:create"].invoke
  end
  task :seed, [:environment] do 
    Rake::Task["db:seed"].invoke
  end
  task :auth, [:environment] do 
    Rake::Task["import:auth"].invoke
  end
  task :import, [:environment] do 
    Rake::Task["import:run"].invoke
  end
  task :update, [:environment] do 
    Rake::Task["update:authors"].invoke
  end
  task :elastic_search, [:environment] do 
    Rake::Task["elastic_search:import"].invoke
  end

end