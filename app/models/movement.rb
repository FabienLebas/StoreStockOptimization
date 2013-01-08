class Movement < ActiveRecord::Base
  attr_accessible :articleCode, :movementDate, :quantity, :turnover
end
