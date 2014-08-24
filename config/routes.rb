Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  #devise_for :users , controllers: {registrations: 'users/registrations',
   #                                 passwords:     'users/passwords'
    #                                }
  # mondblogger
  mount MongodbLogger::Server.new, at: "/logs"

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact_us'
  get 'books/search'
  get 'pages/navbar'
 # get 'pages/stats'
  
  match 'stats', to: 'pages#stats', via: :get

  resources :classifieds do
    member do
      post :contact_seller
      post :booth_pickup
    end
  end

  # root to: 'classifieds#index'
  root to: 'pages#home'
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:post, :get]
  match 'auth/failure', to: redirect('/'), via: [:post, :get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:post, :get]




  # autocomplete on form
  get '/classifieds/autocomplete/' => 'classifieds#autocomplete'

  # current state
  get '/state/' => 'application#state'

end
