class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_admin_or_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :index, :destroy]
  
  # Making sure users can only edit their account
  def current_object
    @current_object ||= @current_user
  end
  
  make_resourceful do
    actions :all
    
    before :show do
      if current_user.is_admin?
        #@servers = Server.all
        @servers = Server.paginate :page => params[:servers_page], :order => 'created_at DESC', :per_page => 5
        #@ftpusers = Ftpuser.all
        @ftpusers = Ftpuser.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
      else
        @ftpusers = current_object.ftpusers.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
      end
    end
  end
end
