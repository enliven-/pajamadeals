Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact_us'
  get 'books/search'

  resources :classifieds do
    resources :picks, only: [:new, :create]
    member do
      post :contact_seller
    end
  end

  root to: 'pages#home'

  # mondblogger
  mount MongodbLogger::Server.new, :at => "/logs"

  # autocomplete on form
  get '/search/books/' => 'books#search'


  # autocomplete on navbar search
  get '/search/classifieds/' => 'classifieds#search'
end
