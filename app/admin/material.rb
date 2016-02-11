ActiveAdmin.register Material do
  filter :name
  permit_params :name
  menu parent: "Каталог", priority: 5

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
