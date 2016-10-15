Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  mount SeeYou::API => '/api'
  resources :pictures
  resources :users
  post "authentication", to: "users#authentication"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
