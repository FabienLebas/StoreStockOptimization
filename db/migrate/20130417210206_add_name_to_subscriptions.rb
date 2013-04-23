class AddNameToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :first_name, :string
    add_column :subscriptions, :last_name, :string
    add_column :subscriptions, :card_type, :string
    add_column :subscriptions, :card_expires_on, :date
  end
end
