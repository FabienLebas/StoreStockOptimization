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
    
    def stock_at_replenishment
      self.stock_qty - (Movement.where(:article_code => self.article_code, :movement_date => Date.today-6..Date.today).sum("quantity").to_f / 7)  * Supplier.where(:supplier => self.supplier).first.leadtime + Order.where(:article_code => self.article_code, :expected_delivery_date => Date.today..Date.today+Supplier.where(:supplier => self.supplier).first.leadtime).sum("quantity")
    end
    
    def sales_per_day
      Movement.where(:article_code => self.article_code, :movement_date => Date.today-6..Date.today).sum("quantity").to_f / 7
    end
    
    def stock_lifetime
      self.stock_qty.to_f * 7/Movement.where(:article_code => self.article_code, :movement_date => Date.today-6..Date.today).sum("quantity").to_f
    end
  
end
