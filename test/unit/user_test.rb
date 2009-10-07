require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  
  should_be_paranoid
  
  should_not_allow_mass_assignment_of :is_admin
  should_allow_values_for :is_admin, true, false, "bla"
  
  should "be a boolean" do
     assert self.is_admin.is_boolean
  end
   
  should_validate_presence_of :name
  should_validate_uniqueness_of :email, :login
  
  should_have_and_belong_to_many :groups
  
  # We are not testing authlogic default validations here...
  # They include confirmation of password, requirement of email, 
  # login, and various conditions on these attributes.
  
  context "A newly created user" do
    setup do 
      User.delete_all
      @user = User.make(:with_password)
    end

    should "have a pending status" do
      assert_equal @user.state, 'pending'
    end
  end
  
  context "An active user" do
    setup do 
      User.delete_all
      @user = User.make(:active)
    end

    should "repond to is_admin?" do
      assert_equal @user.is_admin?, @user.is_admin
    end
    
    should "not be an admin" do
      assert_not_equal @user.is_admin?, true
    end
    
  end
end
