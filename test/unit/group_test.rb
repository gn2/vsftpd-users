require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should_be_paranoid
  
  should_have_and_belong_to_many :users
  should_have_many :ftpusers
  
  context "A deleted Group" do
    setup do
      @group = Group.make
      @ftpuser = Ftpuser.make
      @ftpuser.group = @group
      @ftpuser.save
      @group.destroy
    end
    
    should "delete his attached FTP Users" do
      assert_raise(ActiveRecord::RecordNotFound) { Ftpuser.find(@ftpuser.id) }
    end
  end
end
