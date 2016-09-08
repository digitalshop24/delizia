class AddKeywordsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :keywords, :string
  end
end
