class GroupsController < ApplicationController
  before_filter :require_admin
  
  make_resourceful do
    actions :all
    
    after :create_fails, :update_fails do
      flash[:error] = flash[:notice] = ""
    end
  end
end
