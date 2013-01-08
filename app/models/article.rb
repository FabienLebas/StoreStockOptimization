class Article < ActiveRecord::Base
  attr_accessible :articleCode, :articleText, :box, :endLifeDate, :endLifeOption, :estimatedPriceDecreaseRatio, :minimumOfQty, :seasonalityCode, :sellingPriceIncVAT, :stockQty, :stockRisk, :supplier, :unitaryPriceIfBox, :unitaryPriceIfMassive, :vATRate
  has_many:movements
  has_many:orders
  has_many:plannedorders
end
