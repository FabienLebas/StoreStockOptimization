class AddSuccessToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :success, :boolean
    add_column :subscriptions, :authorization, :string
    add_column :subscriptions, :message, :string
    add_column :subscriptions, :params, :text
  end
end
