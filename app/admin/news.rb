ActiveAdmin.register News do
  menu :priority => 2
  permit_params :head, :short, :middle, :full, :image, :title, :description
  filter :head
  form do |f|
    f.inputs "Подробно" do
      f.input :head
      f.input :short
      f.input :middle
      f.input :full
      f.input :image, as: :file, hint: (image_tag(object.image.url(:thumb)) if object.image_file_name)
      f.input :title
      f.input :description
    end
    f.actions
  end
  index do
    selectable_column
    column :head
    column :short
    actions
  end
  show do |news|
    attributes_table do
      row :head
      row :short
      row :middle
      row :full
      row :image  do |news|
        if news.image_file_name
          image_tag(news.image.url(:medium))
        end
      end
      row :title
      row :description
    end
  end
end
