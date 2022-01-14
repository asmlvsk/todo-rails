Rails.application.routes.draw do
  resources :categories
  resources :tasks, only: [:index, :create, :update, :destroy, :show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
