class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.string :name
      t.attachment :logo
      t.text :description
      t.timestamps null: false
    end
  end
end
