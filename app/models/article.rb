class Article < ActiveRecord::Base
  attr_accessible :article_code, :article_text, :model_code, :model_name, :family, :department, :box, :end_life_date, :end_life_option, :estimated_price_decrease_ratio, :minimum_of_qty, :seasonality_code, :selling_price_inc_vat, :stock_qty, :stock_risk, :supplier, :unitary_price_if_box, :unitary_price_if_massive, :vat_rate, :user
  has_many:movements
  has_many:orders
  has_many:plannedorders
  has_many:suppliers
  belongs_to:seasonalities
  belongs_to:users
  
  acts_as_xlsx
  
  def self.search(search)
        if search
          where('article_text LIKE ?', "%#{search}%")
        else
          scoped
        end
    end
  
end
