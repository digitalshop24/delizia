ActiveAdmin.register Entry do
  actions :all, except: [:new, :show, :edit]

  filter :created_at

  index do
    selectable_column
    column :name
    column :phone
    column :message
    column :created_at
    actions
  end


end
