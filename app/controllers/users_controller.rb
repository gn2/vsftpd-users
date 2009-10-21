class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_admin_or_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :require_admin, :only => [:index, :destroy, :activate, :inactivate, :ban]
  
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
    actions :index, :show, :new, :create, :edit, :update
    
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
  
  def destroy
    if current_object != @current_user
      current_object.delete!
      current_object.destroy
      flash[:notice] = "This user has been deleted successfully!"
    else
      flash[:error] = "You cannot delete your own account!"
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end
  
  def activate
    if current_object != @current_user
      current_object.activate!
      flash[:notice] = "This user has been activated successfully!"
    else
      flash[:error] = "You cannot update your own state!"
    end
    redirect_to user_path(current_object)
  end
  
  def inactivate
    if current_object != @current_user
      current_object.inactivate!
      flash[:notice] = "This user has been inactivated successfully!"
    else
      flash[:error] = "You cannot update your own state!"
    end
    redirect_to user_path(current_object)
  end
  
  def ban
    if current_object != @current_user
      current_object.ban!
      flash[:notice] = "This user has been banned successfully!"
    else
      flash[:error] = "You cannot update your own state!"
    end
    redirect_to user_path(current_object)
  end
  
  def new_password
    @current_object = User.new
  end
  
  def send_password
    if @current_object = User.find_by_login(params[:user][:login])
      respond_to do |format|
        format.html { redirect_to(root_url) }
      end
    else
      @current_object = User.new
      flash[:error] = "You provided a wrong login!"
      #@current_object.error_messages = "You provided a wrong login!"
      #@current_object.errors.invalid?(:login) = :true
      render :new_password
    end
  end
             
  def edit_password
  end
     
  def update_password
  end
  
end
