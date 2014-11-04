class Customer < ActiveRecord::Base
   validates :email,:FirstName,:LastName,:imei, :presence => true
   validates :email, :uniqueness=> true
   belongs_to :country,:class_name=>"Country",:foreign_key=>"Country_id"
end
