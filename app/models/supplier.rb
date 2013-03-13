class Supplier < ActiveRecord::Base
  attr_accessible :leadtime, :order_minimum_qty, :order_minimum_value, :supplier, :supplier_text, :user
  has_many :users
  has_many :articles
  
  acts_as_xlsx
  
end
