ActiveAdmin.register Collection do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :factory_id, :type_id, :zone_id, :material_id, :name, :image, :description

index do
  column :image  do |e|
    if e.image_file_name
    image_tag(e.image.url)
    end
  end
  column :name
  column :description
  column :factory
  column :type
  column :zone
  actions
end
form do |f|
	f.inputs "Collection Details" do
        f.input :name
	f.input :description
        f.input :factory
	f.input :type
	f.input :zone
	f.input :material
	f.input :image, :as => :file
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
