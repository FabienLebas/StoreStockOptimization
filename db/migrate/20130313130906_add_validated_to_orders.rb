class AddValidatedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :validated, :boolean
    add_column :orders, :validation_date, :date
  end
end
