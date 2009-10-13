require "digest/md5"

class FtpusersController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :require_user
  before_filter :require_authorised_user, :except => [:new, :create, :index]
  before_filter :encrypt_password, :only => [:create, :update_password]
  
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
  end
  
  def update_password
    respond_to do |format|
      if current_object.update_password(params[:ftpuser])
        flash[:notice] = 'Password has been successfully updated.'
        
        format.html { redirect_to(current_object) }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit_password }
        format.xml  { render :xml => current_object.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  def require_authorised_user
    ftpuser = Ftpuser.find(params[:id])
    if !ftpuser || (!ftpuser.users.exists?(current_user) && !current_user.is_admin?)
      flash[:notice] = "You cannot access this FTP account"
      redirect_to ftpusers_url
    end
  end
  
  def encrypt_password
    params[:ftpuser][:password] = Digest::MD5.hexdigest(params[:ftpuser][:password]) if params[:ftpuser][:password] != ''
    params[:ftpuser][:password_confirmation] = Digest::MD5.hexdigest(params[:ftpuser][:password_confirmation]) if params[:ftpuser][:password_confirmation] != ''
  end
end
