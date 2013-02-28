class RenameColumnsToLowercase < ActiveRecord::Migration
  def up
    rename_column :movements, :articleCode, :article_code
    rename_column :movements, :movementDate, :movement_date
    rename_column :articles, :articleCode, :article_code    
    rename_column :articles, :articleText, :article_text
    rename_column :articles, :endLifeDate, :end_life_date
    rename_column :articles, :endLifeOption, :end_life_option
    rename_column :articles, :estimatedPriceDecreaseRatio, :estimated_price_decrease_ratio
    rename_column :articles, :minimumOfQty, :minimum_of_qty
    rename_column :articles, :seasonalityCode, :seasonality_code
    rename_column :articles, :sellingPriceIncVAT, :selling_price_inc_vat
    rename_column :articles, :stockQty, :stock_qty
    rename_column :articles, :stockRisk, :stock_risk
    rename_column :articles, :unitaryPriceIfBox, :unitary_price_if_box
    rename_column :articles, :unitaryPriceIfMassive, :unitary_price_if_massive
    rename_column :articles, :vATRate, :vat_rate
    rename_column :orders, :articleCode, :article_code
    rename_column :orders, :creationDate, :creation_date
    rename_column :orders, :expectedDeliveryDate, :expected_delivery_date
    rename_column :planned_orders, :articleCode, :article_code
    rename_column :planned_orders, :creationDate, :creation_date
    rename_column :planned_orders, :expectedDeliveryDate, :expected_delivery_date
    rename_column :suppliers, :orderMinimumQty, :order_minimum_qty
    rename_column :suppliers, :orderMinimumValue, :order_minimum_value
    rename_column :suppliers, :supplierText, :supplier_text   
  end

  def down
    rename_column :movements, :article_code, :articleCode
    rename_column :movements, :movement_date, :movementDate
    rename_column :articles, :article_code, :articleCode
    rename_column :articles, :article_text, :articleText
    rename_column :articles, :end_life_date, :endLifeDate
    rename_column :articles, :end_life_option, :endLifeOption
    rename_column :articles, :estimated_price_decrease_ratio, :estimatedPriceDecreaseRatio
    rename_column :articles, :minimum_of_qty, :minimumOfQty
    rename_column :articles, :seasonality_code, :seasonalityCode
    rename_column :articles, :selling_price_inc_vat, :sellingPriceIncVAT
    rename_column :articles, :stock_qty, :stockQty
    rename_column :articles, :stock_risk, :stockRisk
    rename_column :articles, :unitary_price_if_box, :unitaryPriceIfBox
    rename_column :articles, :unitary_price_if_massive, :unitaryPriceIfMassive
    rename_column :articles, :vat_rate, :vATRate
    rename_column :orders, :article_code, :articleCode
    rename_column :orders, :creation_date, :creationDate
    rename_column :orders, :expected_delivery_date, :expectedDeliveryDate
    rename_column :planned_orders, :article_code, :articleCode
    rename_column :planned_orders, :creation_date, :creationDate
    rename_column :planned_orders, :expected_delivery_date, :expectedDeliveryDate
    rename_column :suppliers, :order_minimum_qty, :orderMinimumQty
    rename_column :suppliers, :order_minimum_value, :orderMinimumValue
    rename_column :suppliers, :supplier_text, :supplierText
  end
end
