Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users , controllers: {registrations: 'users/registrations',
                                    passwords:     'users/passwords'
                                   }

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact_us'
  get 'books/search'
  get 'pages/navbar'

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
  
  # current state
  get '/state/' => 'application#state'

end
