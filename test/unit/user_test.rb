require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  context "A new user" do
    setup do 
      @user = User.make
    end
    
    should "have a pending status" do
      assert @user.state = 'pending'
    end
  end
end
