class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.string :articleCode
      t.date :movementDate
      t.float :turnover
      t.integer :quantity

      t.timestamps
    end
  end
end
