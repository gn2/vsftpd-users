require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  
  should_be_paranoid
  
  should_not_allow_mass_assignment_of :is_admin
  # should_allow_values_for :is_admin, 0, 1
  # should_not_allow_values_for :is_admin, "bla", 3
   
  should_validate_presence_of :name
  should_validate_uniqueness_of :email, :login
  
  should_have_and_belong_to_many :groups
  
  # We are not testing authlogic default validations here...
  # They include confirmation of password, requirement of email, 
  # login, and various conditions on these attributes.
  
  context "A newly created user" do
    setup do 
      User.delete_all
      @user = User.make
    end

    should "have a pending status" do
      assert_equal @user.state, 'pending'
    end
  end
  
  context "An active user" do
    setup do 
      User.delete_all
      @user = User.make(:user_active)
    end

    should "repond to is_admin?" do
      assert_equal @user.is_admin?, @user.is_admin
    end
    
    should "not be an admin" do
      assert !@user.is_admin?
    end
    
  end
  
  context "An active admin" do
    setup do 
      User.delete_all
      @user = User.make(:admin_active)
    end

    should "repond to is_admin?" do
      assert_equal @user.is_admin?, @user.is_admin
    end
    
    should "be an admin" do
      assert @user.is_admin?
    end
  end
  
  context "A recently activated user" do
    setup do
      @user = User.make
      @user.activate!
    end
    
    should "be recognized as recently activated" do
      assert @user.recently_activated?
    end
    
    should "not be deleted" do
      assert_nil @user.deleted_at
    end
  end
  
  context "A User's FTPUsers list" do
    setup do
      @user = User.make(:user_active)
      @group = Group.make
      @ftpuser1 = Ftpuser.make_unsaved
      @ftpuser2 = Ftpuser.make_unsaved
      @ftpuser1.group = @group
      @user.groups << @group
      @ftpuser1.save
      #@user.save
    end
    
    should "contain 'FTPUser1'" do
      assert @user.ftpusers.include?(@ftpuser1)
    end
    
    should "not contain 'FTPUser2'" do
      assert !@user.ftpusers.include?(@ftpuser2)
    end
  end
  
  context "A User's Servers list" do
    setup do
      @user = User.make(:user_active)
      @group = Group.make
      @server1 = Server.make
      @server2 = Server.make
      @ftpuser1 = Ftpuser.make
      @ftpuser2 = Ftpuser.make
      @ftpuser1.group = @group
      @ftpuser1.server = @server1
      @ftpuser2.server = @server2
      @user.groups << @group
      @ftpuser1.save
      @ftpuser2.save
    end
    
    should "contain 'Server1'" do
      assert @user.servers.include?(@server1)
    end
    
    should "not contain 'Server2'" do
      assert !@user.servers.include?(@server2)
    end
  end
  
  context "The admins list" do
    setup do
      @admin = User.make(:admin_active)
      @user = User.make(:user_active)
    end
  
    should "contain 'admin'" do
      assert User.admins.include?(@admin)
    end
    
    should "not contain 'user'" do
      assert !User.admins.include?(@user)
    end
  end
  
  context "A changed password" do
    setup do
      @user = User.make(:user_active)
      @old_password = @user.password
      @user.update_password(:password => "bla", :password_confirmation => "bla")
    end
      
    should "be seen as a recent change" do
      assert @user.password_recently_changed?
    end
    
    should "not be the same than the old one" do
      assert_not_equal @old_password, @user.password
    end
  end
  
  context "A changed groups list" do
    setup do
      @user = User.make
      @group1 = Group.make
      @user.groups << @group1
      @group2 = Group.make
      @group2.id = 100
      @group2.save
      params = {:groups => ["100"]}
      @user.update_groups(params)
      # @user.save
    end
    
    should "not contain group1" do
      assert !@user.groups.include?(@group1)
    end
    
    should "contain group2" do
      assert @user.groups.include?(@group2)
    end
  end
end
