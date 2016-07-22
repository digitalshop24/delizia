class AddColumnToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :position, :string, null: false, default: 'top'
  end
end
