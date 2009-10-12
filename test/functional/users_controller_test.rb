require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < ActionController::TestCase

  context "Users" do
    context "on GET to :new" do
      setup do
        get :new
      end
    
      should_assign_to :user
      should_render_template :new
      should_respond_with :success
      should_not_set_the_flash
    end
  
    context "on POST to :create" do
      setup do
        @nb = User.count
        post :create, :user => {:name => "new user", :login => "new_user", :email => "new_user@example.net", :password => "123456", :password_confirmation => "123456"}
      end
      
      should_assign_to :user
      should_redirect_to("the newly created user") { user_path(assigns :user)}
      should_set_the_flash_to(/create/i)
      should "add 1 to the counter" do
        assert_equal @nb + 1, User.count
      end
    end
    
    context "Logged User" do
      setup do
        UserSession.create(users(:ben))
      end
      
      context "on GET to :edit allowed on his own account" do
        setup do
          get :edit, :id => users(:ben).id
        end
      
        should_assign_to :user
        should_render_template :edit
        should_respond_with :success
        should_not_set_the_flash
      end
  
      context "on GET to :edit forbidden on another account" do
        setup do
          get :edit, :id => users(:one).id
        end
        
        should_redirect_to("the real user account") { user_path(users(:ben))}
        should_set_the_flash_to(/forbidden/i)
      end
      
      context "on PUT to :update" do
        setup do
          put :update, :id => users(:ben).id, :user => {:name => "new name", :login => "new_login", :email => "new_user@example.net", :password => "123456", :password_confirmation => "123456"}
        end
        should_assign_to :user
        should_redirect_to("the updated user") { user_path(assigns :user)}
        should_set_the_flash_to(/update|save/i)
        should "change the name" do
          assert_equal((assigns :user).name, "new name")
        end
        should "change the login" do
          assert_equal((assigns :user).login, "new_login")
        end
        should "not change the password" do
          assert_equal((assigns :user).password, "a30b0e305df0d0f34e0c2b1952ca8e99d6ad03b784794f11aec460361d76c85fa3bbe87fa5e981ea67e6d555d3a3f5d46b6ee57b5d2358861e96aac950cfa99d")
        end
      end

      context "on GET to :show" do
        setup do
          UserSession.create(users(:ben))
          get :show, :id => users(:ben).id
        end

        should_assign_to :servers
        should "load every server" do
          assert_equal(assigns(:servers), Server.all)
        end
        should_assign_to :ftpusers
        should "load load the user's ftpusers" do
          assert_equal(assigns(:ftpusers), users(:ben).ftpusers)
        end
        should_assign_to :servers
        should_respond_with :success
        should_render_template :show
        should_not_set_the_flash
      end

      context "on GET to :index" do
        setup do
          get :index
        end
        should_assign_to :users
        should_respond_with :success
        should_render_template :index
        should_not_set_the_flash
      end

      context "on DELETE to :destroy" do
        setup do
          @nb = User.count
          delete :destroy, :id => 1
        end
        should_assign_to :user
        should_set_the_flash_to(/delete/i)
        should_redirect_to("the users page") { users_path }
        should "remove 1 to the counter" do
          assert_equal @nb - 1, User.count
        end
      end
    end
  end
end
