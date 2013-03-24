class AddMovementTypeToMovements < ActiveRecord::Migration
  def change
    add_column :movements, :movement_type, :string
  end
end
