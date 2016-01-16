ActiveAdmin.register Tile do
menu :priority => 5
	# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
filter :code
filter :name
filter :width
filter :length
filter :single_price
filter :price
filter :compose_price
filter :surface
filter :collection
permit_params :code, :single_price, :compose_price, :name, :width, :length, :image, :price, :surface_id, :collection_id
index do
	selectable_column
	column :image  do |e|
    if e.image_file_name
      image_tag(e.image.url(:thumb))
    end
  end
  column :name
  column :width
  column :length
  column :surface
  column :collection
  column :price
	column :single_price
	column :compose_price
	column :code
  actions
end
form do |f|
	f.inputs "Подробно" do
        f.input :name
	f.input :width
        f.input :length
	f.input :image, :as => :file
	f.input :price
	f.input :single_price
	f.input :compose_price
	f.input :collection
	f.input :surface
	f.input :code
	end
f.actions
end
show do |collection|
	    attributes_table do
				row :name
				row :collection
				row :surface
				row :width
				row :length
				row :price
				row :single_price
				row :compose_price
				row :code
			end
end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
