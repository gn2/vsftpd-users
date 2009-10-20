require File.dirname(__FILE__) + '/../test_helper'
require 'home_controller'

class HomeControllerTest < ActionController::TestCase
  context "An admin homepage" do
    setup do
      UserSession.create(users(:ben))
      get :index
    end
    
    should_assign_to :servers
    should_assign_to :groups
    should_assign_to :ftpusers
    should_not_assign_to :users
  end
  
  context "An user homepage" do
    setup do
      UserSession.create(users(:one))
      get :index
    end
    
    should_not_assign_to :servers
    should_not_assign_to :groups
    should_assign_to :ftpusers
    should_not_assign_to :users
  end
  
end