class AddStartAndEndToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :start, :date
    add_column :subscriptions, :end, :date
  end
end
