class Security < ActiveRecord::Base
  belongs_to :customer,:class_name=>"Customer",:foreign_key=>"Customer_id"
end
