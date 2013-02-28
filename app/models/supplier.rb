class Supplier < ActiveRecord::Base
  attr_accessible :leadtime, :order_minimum_qty, :order_minimum_value, :supplier, :supplier_text
  has_many :users
end
