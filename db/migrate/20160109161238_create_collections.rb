class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.belongs_to :factory, index: true
      t.belongs_to :material, index: true
      t.string :name
      t.text :description
      t.attachment :image
			t.boolean :new
      t.timestamps null: false
    end
  end
end
