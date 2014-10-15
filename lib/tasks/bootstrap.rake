namespace :bootstrap do
  desc "Adding Countries"
  task :add_default_Countries => :environment do
    Country.create(:name=>"Canada",:CountryCode3letter=>"CAN",:CountryCode2letter=>"CA")
    Country.create(:name=>"USA",:CountryCode3letter=>"USA",:CountryCode2letter=>"US")
    Country.create(:name=>"India",:CountryCode3letter=>"IND",:CountryCode2letter=>"IN")
  end
  desc "Running all boootstrapping tasks"
  task :all => [:add_default_Countries]
end