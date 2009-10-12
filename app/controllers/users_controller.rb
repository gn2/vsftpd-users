class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :index, :destroy]
  
  # Making sure users can only edit their account
  def current_object
    @current_object ||= @current_user
  end
  
  make_resourceful do
    actions :all
    
    before :show do
      if current_user.is_admin?
        @servers = Server.all
        @ftpusers = Ftpuser.all
      else
        @ftpusers = current_object.ftpusers
      end
    end
  end
end
