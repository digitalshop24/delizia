class RemoveMaterialFromCollections < ActiveRecord::Migration
  def change
		remove_column :collections, :material_id
	end
end
