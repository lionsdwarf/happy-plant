namespace :query do
  desc "TODO"
  task query_db: :environment do
  # task :query_db => :environment do
    Plant.all.each do |plant|
      plant.thirst_checker
    end
  end
end
