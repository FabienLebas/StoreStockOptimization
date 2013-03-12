class AddUserToPlannedOrders < ActiveRecord::Migration
  def change
    add_column :planned_orders, :user, :string
  end
end
