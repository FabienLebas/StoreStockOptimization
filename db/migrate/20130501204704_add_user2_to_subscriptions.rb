class AddUser2ToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :user2, :string
  end
end
