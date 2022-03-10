Rails.application.routes.draw do
  resources :users
  resources :categories, only: [:index]
  resources :tasks, only: [:index, :create, :update, :destroy, :show] do
    resources :categories, only: [:update]
  end
  put '/tasks/:id', to: 'categories_tasks#update'
  resources :sessions, only: [:create, :update]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
