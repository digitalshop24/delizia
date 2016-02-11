ActiveAdmin.register Collection do
  menu parent: "Каталог", priority: 1

  permit_params  :new, :factory_id, :name, :description, :slider_image, :slider, :home_page, images: [], type_ids: [], zone_ids: [], material_ids: []
  filter :name
  filter :factory
  filter :type
  filter :zone
  filter :new
  index do
    selectable_column
    column :name
    column :factory
    column :type do |collection|
      collection.types.pluck(:name).join(', ')
    end
    column :zone do |collection|
      collection.zones.pluck(:name).join(', ')
    end
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
      f.input :types, as: :check_boxes , collection: Type.all, member_label: Proc.new { |pr| "#{pr.name}" }
      f.input :zones, as: :check_boxes
      f.input :materials, as: :check_boxes
      f.input :new
      f.input :home_page
    end
    f.actions
  end
  show do |collection|
    attributes_table do
      row :name
      row :description
      row :new
      row :home_page
      row :images do
        render(partial: 'images/images_with_preview', locals: { object: collection, page: 'show' } )
      end
      row :type do |c|
        c.types.each do |type|
          div do
            link_to type.name, admin_type_path(type.id)
          end
        end
      end
      row :zone do |c|
        c.zones.each do |zone|
          div do
            link_to zone.name, admin_zone_path(zone.id)
          end
        end
      end
      row :material do |c|
        c.materials.each do |material|
          div do
            link_to material.name, admin_material_path(material.id)
          end
        end
      end

    end
  end
end
