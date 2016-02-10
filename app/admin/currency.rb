ActiveAdmin.register Currency do
  actions :all, except: [:new, :show, :destroy]
  permit_params :course

  before_filter :skip_sidebar!, only: :index

  index do
    column :course
    actions
  end
  
end
