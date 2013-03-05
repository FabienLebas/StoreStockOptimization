class AddModelToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :model_code, :string
    add_column :articles, :model_name, :string
  end
end
