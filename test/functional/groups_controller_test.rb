require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

  context "ServersController, logged as a USER" do
    setup do
      UserSession.create(users(:one))
    end
    
    context "on GET to :index" do
      setup do
        get :index
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on GET to :show" do
      setup do
        get :show, :id => 1
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on GET to :edit" do
      setup do
        get :edit, :id => 1
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on GET to :new" do
      setup do
        get :new
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on PUT to :update" do
      setup do
        put :update, :id => 1, :group => {:name => "new name", :description => "new description"}
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on POST to :create" do
      setup do
        post :create
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
    
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id => 1
      end
      should_redirect_to("the user account page") { account_path() }
      should_set_the_flash_to(/(should|must).*admin/i)
    end
  end

  context "ServersController, logged as an ADMIN" do
    setup do
      UserSession.create(users(:ben))
    end
    
    context "on GET to :index" do
      setup do
        get :index
      end
      should_assign_to :groups
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end
    
    context "on GET to :new" do
      setup do
        get :new
      end
      should_assign_to :group
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
    
    context "on POST to :create" do
      setup do
        @nb = Group.count
        post :create, :group => {:name => Sham.name, :description => Sham.description}
      end
      should_assign_to :group
      should_redirect_to("the newly created group") { group_path(assigns :group)}
      should_set_the_flash_to(/create/i)
      should "add 1 to the counter" do
        assert_equal @nb + 1, Group.count
      end
    end
    
    context "on GET to :show" do
      setup do
        get :show, :id => 1
      end
      should_assign_to :group
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :show
    end
      
    context "on GET to :edit" do
      setup do
        get :edit, :id => 1
      end
      should_assign_to :group
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
      
    context "on PUT to :update" do
      setup do
        put :update, :id => 1, :group => {:name => "new name", :description => "new description"}
      end
      should_assign_to :group
      should_redirect_to("the updated group") { group_path(assigns :group)}
      should_set_the_flash_to(/update|save/i)
      should "well changed the name" do
        assert_equal((assigns :group).name, "new name")
      end
    end
      
    context "on DELETE to :destroy" do
      setup do
        @nb = Group.count
        delete :destroy, :id => 1
      end
      should_assign_to :group
      should_set_the_flash_to(/delete/i)
      should_redirect_to("the groups page") { groups_path }
      should "remove 1 to the counter" do
        assert_equal @nb - 1, Group.count
      end
    end
  end
  
end
