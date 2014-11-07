class Cart < ActiveRecord::Base
  has_many :cartlineitems
end
