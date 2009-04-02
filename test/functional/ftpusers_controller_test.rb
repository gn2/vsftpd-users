require File.dirname(__FILE__) + '/../test_helper'
require 'ftpusers_controller'

# Re-raise errors caught by the controller.
class FtpusersController; def rescue_action(e) raise e end; end

class FtpusersControllerTest < Test::Unit::TestCase
  fixtures :ftpusers

  def setup
    @controller = FtpusersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:ftpusers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ftpuser
    old_count = Ftpuser.count
    post :create, :ftpuser => { }
    assert_equal old_count + 1, Ftpuser.count

    assert_redirected_to ftpuser_path(assigns(:ftpuser))
  end

  def test_should_show_ftpuser
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_ftpuser
    put :update, :id => 1, :ftpuser => { }
    assert_redirected_to ftpuser_path(assigns(:ftpuser))
  end

  def test_should_destroy_ftpuser
    old_count = Ftpuser.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Ftpuser.count

    assert_redirected_to ftpusers_path
  end
end
