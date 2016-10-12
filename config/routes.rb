Rails.application.routes.draw do
  mount API::Base => '/api'
  resources :pictures
  resources :users
  post "authentication", to: "users#authentication"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
