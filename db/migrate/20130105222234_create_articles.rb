class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :articleCode
      t.string :articleText
      t.string :supplier
      t.integer :box
      t.integer :minimumOfQty
      t.string :stockRisk
      t.float :unitaryPriceIfBox
      t.float :unitaryPriceIfMassive
      t.float :sellingPriceIncVAT
      t.float :vATRate
      t.float :estimatedPriceDecreaseRatio
      t.date :endLifeDate
      t.string :endLifeOption
      t.string :seasonalityCode
      t.integer :stockQty

      t.timestamps
    end
  end
end
