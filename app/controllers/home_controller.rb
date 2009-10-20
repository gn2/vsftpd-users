class HomeController < ApplicationController
  before_filter :require_user

  def index
    if current_user.is_admin?
      @servers = Server.paginate :page => params[:servers_page], :order => 'created_at DESC', :per_page => 5
      @ftpusers = Ftpuser.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
      @groups = Group.paginate :page => params[:groups_page], :order => 'created_at DESC', :per_page => 5
    else
      @ftpusers = current_user.ftpusers.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
    end
    
    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { head :ok }
    end
    
  end

end
