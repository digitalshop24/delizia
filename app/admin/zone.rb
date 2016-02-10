ActiveAdmin.register Zone do
  filter :name
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
