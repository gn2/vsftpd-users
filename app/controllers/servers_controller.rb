class ServersController < ApplicationController
  #before_filter :require_user, :only => []
  #before_filter :require_admin, :only => [:new, :create, :edit, :update, :destroy, :index, :show]
  before_filter :require_admin
  
  make_resourceful do
    actions :all
    
    after :create_fails, :update_fails do
      flash[:error] = flash[:notice] = ""
    end
  end

end
