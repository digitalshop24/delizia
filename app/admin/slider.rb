ActiveAdmin.register Slider do
  menu :priority => 8
  permit_params :priority, :image

  index do
    selectable_column
    column :priority
    column :image do |sl|
      image_tag(sl.image.url(:preview)) if sl.image_file_name
    end
    actions
  end

  form do |f|
    f.inputs "Подробно" do
      f.input :priority
      f.input :image, as: :file
    end
    f.actions
  end

  show do |sl|
    attributes_table do
      row :priority
      row :image  do |sl|
        image_tag(sl.image.url(:preview)) if sl.image_file_name
      end
    end
  end
end
