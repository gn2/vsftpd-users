ActionController::Routing::Routes.draw do |map|
  map.home '/home', :controller => 'home', :action => 'index'
  map.resources :servers
  map.resources :ftpusers, :member => {:edit_password => :get, :update_password => :put}
  map.resources :groups

  map.resource :account, :controller => "users"
  map.resources :users,
    :member => {
      :activate => :put,
      :inactivate => :put,
      :ban => :put
    },
    :collection => {
      :new_password => :get,
      :send_password => :post,
      :edit_password => :get,
      :update_password => :put
    }
  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # map.connect "/ftpusers/:id/edit_password",
  #   :controller => "ftpusers",
  #   :action => "edit_password"
  
  map.connect '*path', :controller => 'static', :action => 'show'
end
