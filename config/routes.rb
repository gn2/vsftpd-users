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
      :ban => :put,
      :update_password => :put,
      :manage_groups => :get,
      :update_groups => :put,
      :grant_admin => :put,
      :revoke_admin => :put
    },
    :collection => {
      :new_password => :get,
      :send_password => :post,
    }
  map.edit_password_user 'users/edit_password/:token', :controller => 'users', :action => 'edit_password'
  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # map.connect "/ftpusers/:id/edit_password",
  #   :controller => "ftpusers",
  #   :action => "edit_password"
  
  map.connect '*path', :controller => 'static', :action => 'show'
end
