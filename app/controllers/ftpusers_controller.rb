class FtpusersController < ApplicationController
  before_filter :require_admin, :only => [:new, :create, :edit, :update, :index, :destroy]
  before_filter :require_user, :only => [:show, :edit_password, :update_password]
  
  make_resourceful do
    actions :all
    
    belongs_to :server
    belongs_to :group
    
    before :new, :create, :edit, :update do
      @servers  = Server.all.collect {|server| [server.name.to_s, server.id.to_s] }
      @groups    = Group.all.collect {|group| [group.name.to_s, group.id.to_s] }
    end
  end

  def edit_password
    @ftpuser = Ftpuser.find(params[:id])
  end
  
  def update_password
    @ftpuser = Ftpuser.find(params[:id])
    #@ftpuser.password = params[:password]
    
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

end
