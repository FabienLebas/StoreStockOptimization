class Article < ActiveRecord::Base
  attr_accessible :articleCode, :articleText, :box, :endLifeDate, :endLifeOption, :estimatedPriceDecreaseRatio, :minimumOfQty, :seasonalityCode, :sellingPriceIncVAT, :stockQty, :stockRisk, :supplier, :unitaryPriceIfBox, :unitaryPriceIfMassive, :vATRate
 
end
