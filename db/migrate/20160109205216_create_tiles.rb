class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.belongs_to :amount, index: true
			t.belongs_to :collection, index: true	 
      t.belongs_to :surface, index: true
      t.string :name
      t.attachment :image
      t.integer :width
      t.string :code
			t.integer :length
      t.integer :price
      t.timestamps null: false
    end
  end
end
