require File.dirname(__FILE__) + '/../test_helper'

class ServerTest < Test::Unit::TestCase
  
  should_be_paranoid
  
  should_validate_presence_of :name, :description, :ip_address
  
  should_have_many :ftpusers
  
  context "A BAD IP address" do
    setup do
      @server = Server.make
      @server.ip_address = "152.1020.154.10"
    end
    
    should "not be saved" do
      assert !@server.save
    end
  end
   
  context "A GOOD IP address" do
    setup do
      @server = Server.make
      @server.ip_address = "152.102.154.10"
    end

    should "be saved" do
      assert @server.save
    end
  end

  context "A deleted Server" do
    setup do
      @server = Server.make
      @ftpuser = Ftpuser.make
      @ftpuser.server = @server
      @ftpuser.save
      @server.destroy
    end
    
    should "be properly deleted" do
      assert_not_equal @server.deleted_at, nil
    end
    
    should "delete his attached FTPUsers" do
      assert_not_equal @ftpuser.deleted_at, nil
    end
  end

end
