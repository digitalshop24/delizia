class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :key, null: false
      t.string :name
      t.string :subname
      t.text :content
      t.attachment :image
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
