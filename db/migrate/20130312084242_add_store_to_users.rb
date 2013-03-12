class AddStoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :store, :string
  end
end
