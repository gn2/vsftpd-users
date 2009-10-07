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
  
  # def test_invalid_server_with_empty_attributes
  #   server = Server.new
  #   assert !server.valid?, "Saved the Server with empty attributes"
  #   assert server.errors.invalid?(:name), "Empty name"
  #   assert server.errors.invalid?(:description), "Empty description"
  #   assert server.errors.invalid?(:ip_address), "Empty ip_address"
  # end
  # 
  # def test_invalid_server_with_wrong_ip_address
  #   server = Server.new(:name => "test_name")
  #   
  #   assert_match "#^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$#", server.ip_address, "Saved the Server with wrong IP address"
  #   
  # end
end
