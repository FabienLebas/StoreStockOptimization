class AddUserToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :user, :string
  end
end
