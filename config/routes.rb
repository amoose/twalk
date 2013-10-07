Twalk2::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  # 
  # 
 #  map.with_options :controller => "users" do |user|
	#   user.connect "/users/:nickname", :action => "show"
	#   user.connect "/users/:nickname/edit", :action => "update"
	# end
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
