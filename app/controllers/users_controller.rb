class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_admin_or_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :require_admin, :only => [:index, :destroy, :activate]
  
  # Making sure users can only edit their account
  # def current_object
  #   @current_object ||= @current_user
  # end
  
  def current_object
    if !params[:id] || @current_user.id.to_s == params[:id]
      @current_object ||= @current_user
    elsif @current_user.is_admin?
      @current_object ||= User.find_by_id(params[:id])
    else
      flash[:notice] = "You cannot access this account!"
      redirect_back_or_default home_url
    end
    
    # if !@current_user.is_admin? && @current_user.id == params[:id]
    #   flash[:notice] = "forbidden #{params[:id]}"
    #   redirect_back_or_default home_url
    # else
    #   @current_object ||= @current_user
    # end
    
  end
  
  make_resourceful do
    actions :all
    
    # before :show do
    #       if current_user.is_admin?
    #         #@servers = Server.all
    #         @servers = Server.paginate :page => params[:servers_page], :order => 'created_at DESC', :per_page => 5
    #         #@ftpusers = Ftpuser.all
    #         @ftpusers = Ftpuser.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
    #         
    #         @groups = Group.paginate :page => params[:groups_page], :order => 'created_at DESC', :per_page => 5
    #       else
    #         @ftpusers = current_object.ftpusers.paginate :page => params[:ftpusers_page], :order => 'created_at DESC', :per_page => 5
    #       end
    #     end
  end
  
  def activate
    current_object.activate!
    #flash
    render :show
  end
  
  def password_recovery
    
  end
end
