class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :head
      t.string :short
      t.text :middle
      t.text :full
      t.attachment :image
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
