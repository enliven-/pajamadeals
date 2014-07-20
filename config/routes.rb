Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact_us'
  get 'books/search'

  resources :classifieds do
    member do
      post :contact_seller
      post :booth_pickup
    end
  end

  root to: 'classifieds#index'

  # mondblogger
  mount MongodbLogger::Server.new, at: "/logs"


  # autocomplete on form
  get '/search/books/' => 'books#search'
end
