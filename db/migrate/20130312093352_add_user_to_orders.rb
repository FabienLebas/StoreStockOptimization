class AddUserToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user, :string
  end
end
