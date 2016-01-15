class CreateZonesTypesAndCollections < ActiveRecord::Migration
  def change
    create_table :collections_types do |t|
			t.belongs_to :type, index: true
			t.belongs_to :collection, index: true
    end
    create_table :collections_zones do |t|
			t.belongs_to :zone, index: true
			t.belongs_to :collection, index: true
    end
  end
end
