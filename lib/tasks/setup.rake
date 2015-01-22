namespace :setup do

  task :run, [:environment] do
    Rake::Task["db:migrate"].invoke
    Rake::Task["elastic_search:create"].invoke
    Rake::Task["db:seed"].invoke
    Rake::Task["import:auth"].invoke
    Rake::Task["import:run"].invoke
    Rake::Task["update:authors"].invoke
    Rake::Task["elastic_search:import"].invoke
  end

end
