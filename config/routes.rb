Rails.application.routes.draw do
  resources :listings
  resources :searches
  root 'home#index'
  get 'dashboard' => 'pages#dashboard'
  get 'View/Manage Listings' => 'listings#show'

  resources :users, only: [:new, :show, :edit, :update]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
