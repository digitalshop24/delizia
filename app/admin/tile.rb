ActiveAdmin.register Tile do
menu :priority => 5
	# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
filter :name
filter :width
filter :length
filter :price
filter :surface
filter :collection
permit_params :name, :width, :length, :image, :price, :surface_id, :collection_id
index do
  column :image  do |e|
    if e.image_file_name
      image_tag(e.image(:thumb))
    end
  end
  column :name
  column :width
  column :length
  column :surface
  column :collection
  column :price
  actions
end
form do |f|
	f.inputs "Подробно" do
        f.input :name
	f.input :width
        f.input :length
	f.input :image, :as => :file
	f.input :price
	f.input :collection
	f.input :surface
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
