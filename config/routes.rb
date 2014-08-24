Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users , controllers: {registrations: 'users/registrations',
                                    passwords:     'users/passwords'
                                    }
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

  # root to: 'classifieds#index'
  root to: 'pages#home'




  # autocomplete on form
  get '/classifieds/autocomplete/' => 'classifieds#autocomplete'

  # current state
  get '/state/' => 'application#state'

end
