class Supplier < ActiveRecord::Base
  attr_accessible :leadtime, :orderMinimumQty, :orderMinimumValue, :supplier, :supplierText
  has_many :users
end
