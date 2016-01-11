class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.belongs_to :factory, index: true
      t.belongs_to :type, index: true
      t.belongs_to :zone, index: true
      t.belongs_to :material, index: true
      t.string :name
      t.attachment :image
      t.text :description
      t.boolean :new
      t.timestamps null: false
    end
  end
end
