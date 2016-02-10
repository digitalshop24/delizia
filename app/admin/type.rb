ActiveAdmin.register Type do
  filter :name
  filter :collections
  permit_params :name
  
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
