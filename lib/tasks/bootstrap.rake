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
    Currency.create(:code=>"CAD",:name=>"Canadian Dollar")
  end
  desc "Customer"
  task :add_default_products => :environment do
    Product.create(:description=>'Unlocking of Rogers iPhone 4,4S,5,5C,5S,6,6+',:imageurl=>'/assets/products/rogers200x200.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Unlocking of Bell iPhone 4,4S,5,5C,5S,6,6+',:imageurl=>'/assets/products/Bell200x200.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Unlocking of Telus iPhone 4,4S,5,5C,5S,6,6+',:imageurl=>'/assets/products/telus200x200.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
    Product.create(:description=>'Unlocking of Fido iPhone 4,4S,5,5C,5S,6,6+',:imageurl=>'/assets/products/fido200x200.jpg',:currency_id=>2,:country_id=>1,:price=>40,:deliveryterms=>'3 to 12 hours')
  end
  desc "Running all boootstrapping tasks"
  task :all => [:add_default_Countries,:add_default_Currencies,:add_default_products]
end