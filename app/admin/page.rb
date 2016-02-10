ActiveAdmin.register Page do
  permit_params :name, :subname, :content, :image, :title, :description
  actions :all, except: [:new, :destroy]

  index do
    selectable_column
    column :name
    actions
  end

  form do |f|
    f.inputs "Подробно" do
      f.input :name
      f.input :subname
      f.input :content
      f.input :image, as: :file
      f.input :title
      f.input :description
    end
    f.actions
  end

  show do |page|
    attributes_table do
      row :name
      row :subname
      row :content
      row :image  do |page|
        if page.image_file_name
          image_tag(image.logo.url(:medium))
        end
      end
      row :title
      row :description
    end
  end


end
