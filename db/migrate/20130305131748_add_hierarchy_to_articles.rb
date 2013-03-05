class AddHierarchyToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :family, :string
    add_column :articles, :department, :string
  end
end
