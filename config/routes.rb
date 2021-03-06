Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  delete 'admin/images/:id', to: 'images#destroy', as: :destroy_image
  get 'admin/images/:id/:object_type/:object_id', to: 'images#preview', as: :preview_image

  get 'about', to: 'pages#about', as: :about
  get 'delivery', to: 'pages#delivery', as: :delivery
  get 'dealers', to: 'pages#dealers', as: :dealers
  get 'contacts', to: 'pages#contacts', as: :contacts

  get 'search', to: 'catalog#search', as: :search
  post 'catalog/filter', to: 'catalog#index', as: :filter
  get 'catalog/tags/:url', to: 'tags#show'
  resources :catalog
  resources :factory
  resources :pages, only: [:update]
  resources :menu_items, only: [:create, :destroy, :update, :edit, :new]
  resources :news, only: [:index, :show]
  resources :entries, only: :create

  get 'stat', to: 'home#stat', as: :stat
end
