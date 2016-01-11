ActiveAdmin.register Factory do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
permit_params :name, :logo, :description
index do
  column :logo  do |e|
    if e.logo_file_name
    image_tag(e.logo.url)
    end
  end
  column :name
  column :description
  actions
end
form do |f|
	f.inputs "Factory Details" do
        f.input :name
	f.input :description
	f.input :logo, :as => :file
	end
f.actions
end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
