class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :articleCode
      t.string :supplier
      t.integer :quantity
      t.date :creationDate
      t.date :expectedDeliveryDate

      t.timestamps
    end
  end
end
