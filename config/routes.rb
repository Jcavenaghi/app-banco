Rails.application.routes.draw do
  resources :turns
  devise_for :users
  resources :days
  resources :sucursales
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#home"
end