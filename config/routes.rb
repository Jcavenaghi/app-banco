Rails.application.routes.draw do
  devise_for :users
  resources :turns
  resources :days
  resources :sucursales
  root "main#home"
end
