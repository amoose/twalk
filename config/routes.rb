Twalk2::Application.routes.draw do
  
  mount Mercury::Engine => '/'
  namespace :mercury do
    resources :images
  end
  Mercury::Engine.routes

  namespace :admin do
    resources :themes
  end
  

  resources :presentations, :path => "dashboard" do
    resources :slides do
      resources :contents
    end
    put '/', to: 'presentations#save_presentation'
  end


  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/go/:id/' => 'presentations#launch', :as => :presentation_launch

  get '/sessions/update_geolocation'
  
end
