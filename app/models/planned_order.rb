class PlannedOrder < ActiveRecord::Base
  attr_accessible :articleCode, :creationDate, :expectedDeliveryDate, :quantity, :supplier, :validated
end
