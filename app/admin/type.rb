ActiveAdmin.register Type do
  filter :name
  filter :collections
  permit_params :name
  menu parent: "Каталог", priority: 7
  
  index do
    selectable_column
    column :name
    actions
  end

  show do |collection|
    attributes_table do
      row :name
    end
  end

end
