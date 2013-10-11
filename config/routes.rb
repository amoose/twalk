Twalk2::Application.routes.draw do
  
  

  resources :themes

  resources :presentations do
    resources :slides do
      resources :contents
    end
  end

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/go/:id' => 'presentations#launch'
end
