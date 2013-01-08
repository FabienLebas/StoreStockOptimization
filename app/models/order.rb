class Order < ActiveRecord::Base
  attr_accessible :articleCode, :creationDate, :expectedDeliveryDate, :quantity, :supplier
end
