class AddColumnsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :top_text, :text
    add_column :pages, :bottom_text, :text
  end
end
