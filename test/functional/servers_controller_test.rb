require File.dirname(__FILE__) + '/../test_helper'
require 'servers_controller'

# Re-raise errors caught by the controller.
class ServersController; def rescue_action(e) raise e end; end

class ServersControllerTest < ActionController::TestCase
  
  context "ServerController" do
    context "on GET to :index" do
      setup do
        get :index
      end
      should_assign_to :servers
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end
    
    context "on GET to :new" do
      setup do
        get :new
      end
      should_assign_to :server
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
    
    context "on POST to :create" do
      setup do
        @nb = Server.count
        post :create, :server => {:name => Sham.name, :description => Sham.description, :ip_address => Sham.ip_address}
      end
      should_assign_to :server
      should_redirect_to("the newly created server") { server_path(assigns :server)}
      should_set_the_flash_to(/create/i)
      should "add 1 to the counter" do
        assert_equal @nb + 1, Server.count
      end
    end
    
    context "on GET to :show" do
      setup do
        get :show, :id => 1
      end
      should_assign_to :server
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :show
    end
    
    context "on GET to :edit" do
      setup do
        get :edit, :id => 1
      end
      should_assign_to :server
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
    
    context "on PUT to :update" do
      setup do
        put :update, :id => 1, :server => {:name => "new name", :description => "new description", :ip_address => Sham.ip_address}
      end
      should_assign_to :server
      should_redirect_to("the updated server") { server_path(assigns :server)}
      should_set_the_flash_to(/update|save/i)
      should "well changed the name" do
        assert_equal((assigns :server).name, "new name")
      end
    end
    
    context "on DELETE to :destroy" do
      setup do
        @nb = Server.count
        delete :destroy, :id => 1
      end
      should_assign_to :server
      should_set_the_flash_to(/delete/i)
      should_redirect_to("the servers page") { servers_path }
      should "remove 1 to the counter" do
        assert_equal @nb - 1, Server.count
      end
    end
  end
end
