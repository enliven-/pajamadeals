Rails.application.routes.draw do
  resources :student_ambassadors
  match 'sa', to: 'student_ambassadors#new', via: :get

  ActiveAdmin.routes(self)
  #devise_for :users , controllers: {registrations: 'users/registrations',
   #                                 passwords:     'users/passwords'
    #                                }
  # mondblogger
  mount MongodbLogger::Server.new, at: "/logs"

  get 'pages/home'
  get 'pages/navbar'
  
  match 'stats', to: 'pages#stats', via: :get
  match 'privacypolicy', to: 'pages#privacypolicy', via: :get

  resources :classifieds do
    member do
      post :contact_seller
      post :booth_pickup
    end
  end
  
  resources :users

   root to: 'classifieds#index'
  # root to: 'pages#home'
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:post, :get], as: 'auth_callback'
  match 'auth/failure', to: redirect('/'), via: [:post, :get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:delete]




  # autocomplete on form
  get '/classifieds/autocomplete/' => 'classifieds#autocomplete'

  # current state
  get '/state/' => 'application#state'

end
