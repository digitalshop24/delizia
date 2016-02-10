class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :phone
      t.text :message

      t.timestamps null: false
    end
  end
end
