ActiveAdmin.register Factory do
  menu parent: "Каталог", priority: 2
  
  filter :name
  permit_params :name, :logo, :description
  index do
    selectable_column
    column :logo  do |e|
      if e.logo_file_name
        image_tag(e.logo.url(:thumb))
      end
    end
    column :name
    actions
  end
  form do |f|
    f.inputs "Подробно" do
      f.input :name
      f.input :description
      f.input :logo, as: :file, hint: (image_tag(object.logo.url(:medium)) if object.logo_file_name)
    end
    f.actions
  end
  show do |factory|
    attributes_table do
      row :name
      row :logo  do |factory|
        if factory.logo_file_name
          image_tag(factory.logo.url(:medium))
        end
      end
      row :description
    end
  end
end
