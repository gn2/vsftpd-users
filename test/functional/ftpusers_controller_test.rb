require File.dirname(__FILE__) + '/../test_helper'
#require 'ftpuser'
 require 'ftpusers_controller'

# Re-raise errors caught by the controller.
 class FtpusersController; def rescue_action(e) raise e end; end

class FtpusersControllerTest < ActionController::TestCase
  context "FTPUsersController as USER" do
    setup do
      UserSession.create(users(:one))
      
      # @controller = FtpusersController.new
      # @request    = ActionController::TestRequest.new
      # @response   = ActionController::TestResponse.new
    end

    context "on GET to :show" do
      setup do
        get :show, :id => 1
      end

      should_assign_to :ftpuser
      should_respond_with :success
      should_render_template :show
      should_not_set_the_flash
    end
  end
  
  context "FTPUsersController as ADMIN" do
    setup do
      UserSession.create(users(:ben))
      
      # @controller = FtpusersController.new
      # @request    = ActionController::TestRequest.new
      # @response   = ActionController::TestResponse.new
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
        post :create, :ftpuser => {:login => Sham.login, :password => Sham.password, :group => Group.new, :server => Server.new}
      end
    
      should_assign_to :ftpuser
      should_redirect_to("the ftpuser page") { ftpuser_path(assigns :ftpuser) }
      should_set_the_flash_to(/create/i)
    
      should "add 1 to the counter" do
        assert_equal @old_count + 1, Ftpuser.count
      end
    end
   
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

    context "on DELETE to :destroy" do
      setup do
        @old_count = Ftpuser.count
        delete :destroy, :id => 1, :ftpuser => {:login => Sham.login, :password => Sham.password, :group => Group.new, :server => Server.new}
      end
    
      should_assign_to :ftpuser
      should_redirect_to("the ftpusers page") { ftpusers_path }
      should_set_the_flash_to(/delete/i)
    
      should "remove 1 to the counter" do
        assert_equal @old_count - 1, Ftpuser.count
      end
    end
  end
end