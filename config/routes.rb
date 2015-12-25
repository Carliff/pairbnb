Rails.application.routes.draw do
  resources :listings
  resources :searches
  root 'home#index'
  get 'dashboard' => 'pages#dashboard'
  get 'View/Manage Listings' => 'listings#show'

  post '/buy/:slug', to: 'transactions#create', as: :buy 
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup

  post '/booking/:slug', to: 'reservations#create', as: :booking 
  get '/confirm/:guid', to: 'reservations#confirm', as: :confirm

  post '/listings/:slug/edit', to: 'listings#edit'


  resources :users, only: [:new, :show, :edit, :update] do
  	resources :listings
  end

  resources :listings, only: [:new, :show, :edit, :update] do
    resources :reservations
  end

  # resources :reservations

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
