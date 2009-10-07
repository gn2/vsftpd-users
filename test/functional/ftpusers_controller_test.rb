require File.dirname(__FILE__) + '/../test_helper'
#require 'ftpuser'
 require 'ftpusers_controller'

# Re-raise errors caught by the controller.
 class FtpusersController; def rescue_action(e) raise e end; end

class FtpusersControllerTest < ActionController::TestCase
  
  fixtures :ftpusers

  def setup
    @controller = FtpusersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context "on GET to :index" do
    setup do
      get :index
    end

    should_assign_to :ftpusers
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end
  
  context "on GET to :new" do
    setup do
      get :new
    end

    should_assign_to :ftpuser
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end
  
  context "on POST to :create" do
    setup do
      @old_count = Ftpuser.count
      #ftpuser = Ftpuser.make
      #post :create, :ftpuser => {:login => ftpuser.login, :password => ftpuser.password, :group => ftpuser.group, :server => ftpuser.server}
      post :create, :ftpuser => {:login => Sham.login, :password => Sham.password, :group => Group.new, :server => Server.new}
    end
    
    should_assign_to :ftpuser
    should_redirect_to("the ftpuser page") { ftpuser_path(assigns :ftpuser) }
    #should_redirect_to "ftpuser_path(assigns :ftpuser)"
    should_set_the_flash_to(/create/i)
    
    should "add 1 to the counter" do
      assert_equal @old_count + 1, Ftpuser.count
    end
  end
  
  #   def test_should_create_ftpuser
  #     old_count = Ftpuser.count
  #     ftpuser = Ftpuser.make
  #     post :create, :ftpuser => Ftpuser.make.to_param
  #     assert_equal old_count + 1, Ftpuser.count
  # 
  #     assert_redirected_to ftpuser_path(assigns(:ftpuser))
  #   end
   
  context "on GET to :show" do
    setup do
      get :show, :id => 1
    end

    should_assign_to :ftpuser
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to :edit" do
    setup do
      get :edit, :id => 1
    end

    should_assign_to :ftpuser
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end
  
  context "on PUT to :update" do
    setup do
      put :update, :id => 1, :ftpuser => {:login => Sham.login, :password => Sham.password, :group => Group.new, :server => Server.new}
    end
    
    should_assign_to :ftpuser
    should_redirect_to("the ftpuser page") { ftpuser_path(assigns :ftpuser) }
    #should_redirect_to "ftpuser_path(assigns :ftpuser)"
    should_set_the_flash_to(/save/i)
  end
    
  # 
  #   def test_should_update_ftpuser
  #     put :update, :id => 1, :ftpuser => { }
  #     assert_redirected_to ftpuser_path(assigns(:ftpuser))
  #   end
  # 

  context "on DELETE to :destroy" do
    setup do
      @old_count = Ftpuser.count
      delete :destroy, :id => 1, :ftpuser => {:login => Sham.login, :password => Sham.password, :group => Group.new, :server => Server.new}
    end
    
    should_assign_to :ftpuser
    should_redirect_to("the ftpusers page") { ftpusers_path }
    #should_redirect_to "ftpusers_path"
    should_set_the_flash_to(/delete/i)
    
    should "remove 1 to the counter" do
      assert_equal @old_count - 1, Ftpuser.count
    end
  end


  #   def test_should_destroy_ftpuser
  #     old_count = Ftpuser.count
  #     delete :destroy, :id => 1
  #     assert_equal old_count-1, Ftpuser.count
  # 
  #     assert_redirected_to ftpusers_path
  #   end
end