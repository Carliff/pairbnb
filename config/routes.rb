Rails.application.routes.draw do
  resources :listings
  root 'home#index'

  resources :users, only: [:new, :show, :edit, :update]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
