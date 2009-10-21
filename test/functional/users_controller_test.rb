require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < ActionController::TestCase

  context "Users:" do
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
        UserSession.create(users(:one))
      end
      
      context "on GET to :edit allowed on his own account" do
        setup do
          get :edit, :id => users(:one).id
        end
      
        should_assign_to :user
        should_render_template :edit
        should_respond_with :success
        should_not_set_the_flash
      end
    
      context "on GET to :edit forbidden on another account" do
        setup do
          get :edit, :id => users(:two).id
        end
        
        should_redirect_to("the real user homepage") { home_path()}
        should_set_the_flash_to(/forbidden|cannot access/i)
        
        should_assign_to :current_user
        should "load the current user" do
          assert_equal((assigns :current_user), users(:one))
        end
      end
      
      context "on PUT to :update" do
        setup do
          put :update, :id => users(:one).id, :user => {:name => "new name", :login => "new_login", :email => "new_user@example.net", :password => "123456", :password_confirmation => "123456"}
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
      end
      
      context "on GET to :update forbidden on another account" do
        setup do
          put :update, :id => users(:two).id, :user => {:name => "new name", :login => "new_login", :email => "new_user@example.net", :password => "123456", :password_confirmation => "123456"}
        end
        
        should_redirect_to("the real user homepage") { home_path()}
        should_set_the_flash_to(/forbidden|cannot access/i)
        
        should_assign_to :current_user
        should "load the current user" do
          assert_equal((assigns :current_user), users(:one))
        end
      end
      
      context "on GET to :show" do
        setup do
          get :show, :id => users(:one).id
        end

        should_not_assign_to :servers
        should_not_assign_to :groups
        should_not_assign_to :ftpusers

        should_respond_with :success
        should_render_template :show
        should_not_set_the_flash
      end
      
      context "on GET to :show forbidden on another account" do
        setup do
          get :show, :id => users(:two).id
        end

        should_redirect_to("the real user homepage") { home_path()}
        should_set_the_flash_to(/forbidden|cannot access/i)
        
        should_assign_to :current_user
        should "load the current user" do
          assert_equal((assigns :current_user), users(:one))
        end
      end
    end
    
    context "An Admin" do
      setup do
        UserSession.create(users(:ben))
      end
      
      context "on GET to :show" do
        setup do
          get :show, :id => users(:ben).id
        end

        should_not_assign_to :servers
        should_not_assign_to :groups
        should_not_assign_to :ftpusers
        
        should_respond_with :success
        should_render_template :show
        should_not_set_the_flash
      end
      
      context "on GET to :show allowed on another account" do
        setup do
          get :show, :id => users(:one).id
        end

        should_assign_to :user
        should "load the wanted user" do
          assert_equal((assigns :user), users(:one))
        end
        
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
