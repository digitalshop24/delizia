ActiveAdmin.register Factory do
menu :priority => 4
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
filter :name
permit_params :name, :logo, :description
index do
  column :logo  do |e|
    if e.logo_file_name
    image_tag(e.logo(:thumb))
    end
  end
  column :name
  column :description
  actions
end
form do |f|
	f.inputs "Подробно" do
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

show do |collection|
	    attributes_table do
				row :name
				row :description
			end
end

end
