ActiveAdmin.register Tile do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :width, :length, :image, :price, :surface_id, :collection_id
index do
  column :image  do |e|
    if e.image_file_name
      image_tag(e.image.url)
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
	f.inputs "Tile Details" do
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
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
