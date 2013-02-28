class Article < ActiveRecord::Base
  attr_accessible :article_code, :article_text, :box, :end_life_date, :end_life_option, :estimated_price_decrease_ratio, :minimum_of_qty, :seasonality_code, :selling_price_inc_vat, :stock_qty, :stock_risk, :supplier, :unitary_price_if_box, :unitary_price_if_massive, :vat_rate
  has_many:movements
  has_many:orders
  has_many:plannedorders
end
