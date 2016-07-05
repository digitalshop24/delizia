class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :url, unique: true, index: true
      t.text :text
      t.string :title
      t.string :description
      t.string :keywords

      t.timestamps null: false
    end
  end
end
