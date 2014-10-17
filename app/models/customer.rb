class Customer < ActiveRecord::Base
   belongs_to :country,:class_name=>"Country",:foreign_key=>"Country_id"
end
