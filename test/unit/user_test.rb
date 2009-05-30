require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase

  # We are not testing authlogic default validations here...
  # They include confirmation of password, requirement of email, 
  # login, and various conditions on these attributes.
  
  context "A newly created user" do
    setup do 
      @user = User.make(:with_password)
    end

    should "have a pending status" do
      assert_equal @user.state, 'pending'
    end
  end
end
