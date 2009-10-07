require File.dirname(__FILE__) + '/../test_helper'

class FtpuserTest < Test::Unit::TestCase
  should_be_paranoid
  
  should_validate_presence_of :login, :password, :server, :group
  
  should_belong_to :group
  should_belong_to :server
  
end
