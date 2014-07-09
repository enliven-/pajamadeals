Rails.application.routes.draw do
  get 'contact_sellers/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact_us'
  get 'books/search'

  resources :classifieds do
    member do
      resources :picks, only: [:new, :create]
    end
  end

  resources :contact_sellers, only: [:new, :create]


  root to: 'pages#home'

  # mondblogger
  mount MongodbLogger::Server.new, :at => "/logs"

  # autocomplete
  get '/queries/json_completion' => 'books#search'
end
