ActiveAdmin.register Collection do
	menu :priority => 3

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params  :new, :factory_id, :type_id, :zone_id, :material_id, :name, :description, images: []
filter :name
filter :factory
filter :type
filter :zone
filter :new
index do
	selectable_column
  column :name
  column :description
  column :factory
  column :type do |collecton|
	end
  column :zone
  actions
end
form do |f|
	f.inputs "Подробно" do
		f.input :name
		f.input :images, as: :file, input_html: { multiple: true }
		li id: 'images' do
			div class: 'inline-hints' do
				render(partial: 'images/images_with_preview', locals: { object: f.object, page: 'edit' })
				end
			end
		f.input :description
		f.input :factory
		f.input :types, as: :check_boxes
		f.input :zones, as: :check_boxes
		f.input :materials, as: :check_boxes
		f.input :new
	end
f.actions
end
show do |collection|
	    attributes_table do
				row :name
				row :description
	      row :new
	      row :images do
					render(partial: 'images/images_with_preview', locals: { object: collection, page: 'show' } )
	      end
				row :type do |c|
					binding.pry
					link_to c.types.name
				end
				row :zone do |c|
					link_to c.zones.name
				end
				row :material	
			end
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
