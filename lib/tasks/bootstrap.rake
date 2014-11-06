namespace :bootstrap do
  desc "Adding Countries"
  task :add_default_Countries => :environment do
    Country.create(:name=>"Canada",:CountryCode3letter=>"CAN",:CountryCode2letter=>"CA")
    Country.create(:name=>"USA",:CountryCode3letter=>"USA",:CountryCode2letter=>"US")
    Country.create(:name=>"India",:CountryCode3letter=>"IND",:CountryCode2letter=>"IN")
  end
  desc "Currency"
  task :add_default_Currencies => :environment do
    Currency.create(:code=>'USD',:name=>"US Dollar")
    Currency.create(:name=>"CAD",:name=>"Canadian Dollar")
  end
  desc "Customer"
  task :add_default_products => :environment do
    Product.create(:description=>'Rogers iPhone Unlock',:imageurl=>'../assets/products/rogers.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Bell iPhone Unlock',:imageurl=>'../assets/products/virginmobile.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Tellus iPhone Unlock',:imageurl=>'../assets/products/telus.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Fido iPhone Unlock',:imageurl=>'../assets/products/fido.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
  end
  desc "Running all boootstrapping tasks"
  task :all => [:add_default_Countries,:add_default_Currencies,:add_default_products]
end