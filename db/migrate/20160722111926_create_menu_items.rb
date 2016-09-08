class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :text
      t.string :url
      t.integer :priority, null: false, default: 1
      t.integer :parent_id

      t.timestamps null: false
    end
    add_foreign_key :menu_items, :menu_items, column: :parent_id
  end
end
