class FtpusersController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :require_user, :only => [:show, :edit_password, :update_password, :index]
  
  before_filter :current_object, :only => [:edit_password, :update_password, :show]
  
  make_resourceful do
    actions :all
    
    #belongs_to :server
    #belongs_to :group
    
    before :new, :create, :edit, :update do
      @servers  = Server.all.collect {|server| [server.name.to_s, server.id.to_s] }
      @groups    = Group.all.collect {|group| [group.name.to_s, group.id.to_s] }
    end
  end

  def edit_password
    @ftpuser = current_object
  end
  
  def update_password
    @ftpuser = current_object
    
    respond_to do |format|
      if @ftpuser.update_attributes(params[:ftpuser])
        flash[:notice] = 'Password has been successfully updated.'
        
        format.html { redirect_to(@ftpuser) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_password" }
        format.xml  { render :xml => @ftpuser.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  def current_object
    if Ftpuser.find(params[:id]).users.exists?(current_user) || current_user.is_admin?
      @current_object = Ftpuser.find(params[:id])
    else
      flash[:notice] = "You cannot access this FTP account"
      redirect_to ftpusers_url
    end
  end
end
