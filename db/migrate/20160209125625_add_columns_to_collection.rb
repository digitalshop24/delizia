class AddColumnsToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :home_page, :boolean
    add_column :collections, :content, :text
    add_column :collections, :title, :string
  end
end
