class CreateCollectionsMaterials < ActiveRecord::Migration
  def change
    create_table :collections_materials do |t|
			t.belongs_to :collection, index: true
			t.belongs_to :material, index: true
		end
  end
end
