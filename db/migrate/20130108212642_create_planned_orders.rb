class CreatePlannedOrders < ActiveRecord::Migration
  def change
    create_table :planned_orders do |t|
      t.string :articleCode
      t.string :supplier
      t.integer :quantity
      t.date :creationDate
      t.date :expectedDeliveryDate
      t.boolean :validated

      t.timestamps
    end
  end
end
