class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :user
      t.string :option

      t.timestamps
    end
  end
end
