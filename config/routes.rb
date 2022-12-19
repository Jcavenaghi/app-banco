Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    resources :turns
    resources :days
    resources :branch_offices
  end
  devise_for :users
  resources :turns

  root "main#home"
end
