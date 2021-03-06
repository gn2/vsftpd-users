ActionController::Routing::Routes.draw do |map|
  map.resources :servers
  map.resources :ftpusers
  map.resources :groups

  map.resource :account, :controller => "users"
  map.resources :users
  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  map.connect '*path', :controller => 'static', :action => 'show'
end
