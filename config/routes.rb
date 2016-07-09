Twalk2::Application.routes.draw do
  # resources :presentations, param: :user_slug do
  #   resources :slides do
  #     resources :contents
  #   end
  #   put '/', to: 'presentations#save_presentation'
  # end
  resources :users, :only => [:index, :show, :edit, :update ], path: :profile
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout

  namespace :admin do
    resources :themes
  end
  scope ':nickname' do
    resources :presentations, path: '' do
      resources :slides do
        resources :contents
      end
      put '/', to: 'presentations#save_presentation'
    end
  end
  

  get '/nearby' => 'presentations#nearby'
  root :to => "presentations#index"

  resources :users, :only => [:index, :show, :edit, :update ]

  
  get '/auth/:provider/callback' => 'sessions#create'
  
  get '/auth/failure' => 'sessions#failure'

  get '/sessions/update_geolocation'
  

  get '/launch/:id' => 'presentations#launch', :as => :presentation_launch



end
