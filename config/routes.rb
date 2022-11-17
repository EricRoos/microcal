Rails.application.routes.draw do
  devise_for :users
  get 'calendar', to: 'calendar#show'

  get '/manifest', to: 'static#manifest'
  resources :line_items
  root to: 'calendar#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
