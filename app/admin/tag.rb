ActiveAdmin.register Tag do
  menu parent: "Каталог", priority: 8

  permit_params :name, :url, :text, :title, :description, :keywords, collection_ids: []
  filter :name
  filter :url
  index do
    selectable_column
    column :name
    column :url
    actions
  end
  form do |f|
    f.inputs "Подробно" do
      f.input :name
      f.input :url
      f.input :text
      f.input :collections
      f.input :title
      f.input :description
      f.input :keywords
    end
    f.actions
  end
  show do |collection|
    attributes_table do
      row :name
      row :url
      row :text
      row :collections do |c|
        c.collections.map do |collection|
          link_to(collection.name, admin_collection_path(collection.id))
        end.join(', ').html_safe
      end
      row :title
      row :description
      row :keywords
    end
  end
end
