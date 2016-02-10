class CreateFilterSizes < ActiveRecord::Migration
  def change
    create_table :filter_sizes do |t|
      t.string :name
      t.integer :priority
      t.float :min_width
      t.float :max_width
      t.float :min_length
      t.float :max_length

      t.timestamps null: false
    end
  end
end
