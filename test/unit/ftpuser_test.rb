require File.dirname(__FILE__) + '/../test_helper'

class FtpuserTest < Test::Unit::TestCase
  should_be_paranoid
  
  should_validate_presence_of :login, :server, :group
  
  should_belong_to :group
  should_belong_to :server
  
  context "A changed password" do
    setup do
      @ftpuser = Ftpuser.make
      @old_password = @ftpuser.crypted_password
      @ftpuser.update_password({:password => "bla bla", :confirmation_password => "bla bla"})
    end
    
    should "be recognized as changed" do
      assert @ftpuser.password_recently_changed?
    end
    
    should "change the password properly" do
      assert_equal @ftpuser.password, "bla bla"
    end
    
    should "change the crypted password" do
      assert_not_equal @old_password, @ftpuser.crypted_password
    end
  end
  
end
