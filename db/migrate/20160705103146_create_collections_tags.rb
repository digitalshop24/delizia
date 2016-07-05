class CreateCollectionsTags < ActiveRecord::Migration
  def change
    create_table :collections_tags, id: false do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :tag, index: true
    end
  end
end
