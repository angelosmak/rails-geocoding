Rails.application.routes.draw do
  devise_for :users
  get '/beaches/nearby', to: 'beaches#nearby', as: 'nearby_beaches'
  resources :beaches
  root to: "beaches#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
