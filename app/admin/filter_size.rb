ActiveAdmin.register FilterSize do
 permit_params :name, :priority, :min_width, :max_width, :min_length, :max_length
 filter :name
  index do
    selectable_column
    column :name
    column :priority
    column :min_width
    column :max_width
    column :min_length
    column :max_length
    actions
  end

end
