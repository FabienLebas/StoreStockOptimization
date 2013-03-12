class AddUserToMovements < ActiveRecord::Migration
  def change
    add_column :movements, :user, :string
  end
end
