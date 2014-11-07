class Cartlineitem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :orderstatus
end
