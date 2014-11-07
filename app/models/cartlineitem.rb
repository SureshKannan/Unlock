class Cartlineitem < ActiveRecord::Base
  belongs_to :product #,:class_name=>"Product",:foreign_key=>"product_id"
  belongs_to :cart #,:class_name=>"Cart",:foreign_key=>"cart_id"
  belongs_to :orderstatus #,:class_name=>"Orderstatus",:foreign_key=>"orderstatus_id"
  
end
