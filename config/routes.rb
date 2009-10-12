ActionController::Routing::Routes.draw do |map|
  map.resources :servers
  map.resources :ftpusers, :member => {:edit_password => :get, :update_password => :put}
  map.resources :groups

  map.resource :account, :controller => "users"
  map.resources :users
  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # map.connect "/ftpusers/:id/edit_password",
  #   :controller => "ftpusers",
  #   :action => "edit_password"
  
  map.connect '*path', :controller => 'static', :action => 'show'
end
