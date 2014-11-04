class Product < ActiveRecord::Base
  belongs_to :currency
  belongs_to :country
end
