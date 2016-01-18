class ChangeTilesDataType < ActiveRecord::Migration
  def change
		change_table :tiles do |t|
			  t.change :width, :float
			  t.change :length, :float
		end
	end
end
