require File.dirname(__FILE__) + '/../test_helper'

class ServerTest < Test::Unit::TestCase
  def test_invalid_post_with_empty_attributes
    post = Server.new
    assert !post.valid?, "Saved the Server with empty attributes"
    assert post.errors.invalid?(:name), "Empty name"
    assert post.errors.invalid?(:ip_address), "Empty ip_address"
  end
end
