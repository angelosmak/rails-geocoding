Rails.application.routes.draw do
  devise_for :users
  get 'beaches/populate_beaches_from_google_places', to: 'beaches#populate_beaches_from_google_places'
  get '/beaches/nearby', to: 'beaches#nearby', as: 'nearby_beaches'
  resources :beaches
  root to: "beaches#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
