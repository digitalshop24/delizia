class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.integer :priority
      t.attachment :image

      t.timestamps null: false
    end
  end
end
