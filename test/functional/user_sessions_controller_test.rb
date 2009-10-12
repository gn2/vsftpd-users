require File.dirname(__FILE__) + '/../test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context "UsersSessionsController" do
    context "on GET to :new" do
      setup do
        get :new
      end

      should_render_template :new
      should_respond_with :success
      should_not_set_the_flash
    end

    context "on POST to :create with WRONG credentials" do
      setup do
        post :create, :user_session => {:login => Sham.login, :password => Sham.password}
      end

      should_assign_to :user_session
      should_render_template :new
      should_respond_with :success
    end
   
    context "on POST to :create with GOOD credentials" do
      setup do
        post :create, :user_session => { :login => "bjohnson", :password => "benrocks" }
      end

      should_assign_to :user_session

      should "load the current session properly" do
        user_session = UserSession.find
        assert_equal users(:ben), user_session.user
      end
      
      should_redirect_to("the user account page") { account_path }
      should_set_the_flash_to(/successfully logged in/i)
    end
    
    context "on DELETE to :destroy" do
      setup do
        UserSession.create(users(:ben))
        delete :destroy
      end
      
      should "destroy the current session properly" do
        assert_nil UserSession.find
      end
      
      should_redirect_to("the login page") { new_user_session_path }
      should_set_the_flash_to(/logged out/i)
    end
  end  
end