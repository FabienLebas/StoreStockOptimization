class Order < ActiveRecord::Base
  attr_accessible :article_code, :creation_date, :expected_delivery_date, :quantity, :supplier, :validated, :validation_date, :user
end
