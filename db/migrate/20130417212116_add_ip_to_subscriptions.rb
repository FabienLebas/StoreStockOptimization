class AddIpToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :ip_address, :string
  end
end
