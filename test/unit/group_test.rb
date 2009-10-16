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
    
    should "be properly deleted" do
      assert_not_equal @group.deleted_at, nil
    end
    
    should "delete his attached FTPUsers" do
      assert_not_equal @ftpuser.deleted_at, nil
    end
  end
end
