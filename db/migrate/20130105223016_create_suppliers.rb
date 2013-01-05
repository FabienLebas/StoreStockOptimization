class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier
      t.string :supplierText
      t.integer :leadtime
      t.float :orderMinimumQty
      t.float :orderMinimumValue

      t.timestamps
    end
  end
end
