class AddFieldsToTiles < ActiveRecord::Migration
  def change
		add_column :tiles, :single_price, :integer
		add_column :tiles, :compose_price, :integer
	end
end
