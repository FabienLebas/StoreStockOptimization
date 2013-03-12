class AddUserToSeasonalities < ActiveRecord::Migration
  def change
    add_column :seasonalities, :user, :string
  end
end
