class Movement < ActiveRecord::Base
  attr_accessible :article_code, :movement_date, :quantity, :turnover
  belongs_to :article
  
  acts_as_xlsx

end
