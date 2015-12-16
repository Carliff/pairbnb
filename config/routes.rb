Rails.application.routes.draw do
  resources :listings
  resources :searches
  root 'home#index'
  get 'dashboard' => 'pages#dashboard'
  get 'View/Manage Listings' => 'listings#show'

  post '/buy/:slug', to: 'transactions#create', as: :buy 
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup


  resources :users, only: [:new, :show, :edit, :update] do
  	resources :listings
  end

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
