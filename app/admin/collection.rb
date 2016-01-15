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

  column :name
  column :description
  column :factory
  column :type
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
		f.input :type, as: :check_boxes
		f.input :zone, as: :check_boxes
		f.input :material
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
