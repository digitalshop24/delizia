ActiveAdmin.register Zone do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
filter :name
permit_params :name
#
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
			end
end

end
