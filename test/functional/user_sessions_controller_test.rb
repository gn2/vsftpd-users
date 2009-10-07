require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context "Usersessions" do
    context "on GET to :new" do
      setup do
        get :new
      end
    
      # should "be logged in" do
      #   assert_equal current_user, true
      # end
    
      should_render_template :new
      should_respond_with :success
    end
  
    context "on POST to :create with WRONG credentials" do
      setup do
        post :create, :user_session => {:login => Sham.login, :password => Sham.password}
      end
  
      should_assign_to :user_session
      should_render_template :new
      should_respond_with :success
    end
  
    # context "on POST to :create with GOOD credentials" do
    #   setup do
    #     post :create, :user_session => {:login => "MyString", :password => "MyString"}
    #   end
    #   
    #   should_render_template :new
    #   should_respond_with :success
    #   should_set_the_flash_to(/login/i)
    # end
    #   
    # context "on DELETE to :destroy" do
    #   setup do
    #     @current_user_session = UserSession.create
    #     delete :destroy, :id => @current_user_session.to_param
    #   end
    # 
    #   assert_nil @current_user_session
    #   should_set_the_flash_to(/logout/i)
    # end
  end  
end
