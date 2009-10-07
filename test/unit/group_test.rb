require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should_be_paranoid
  
  should_have_and_belong_to_many :users
  should_have_many :ftpusers
end
