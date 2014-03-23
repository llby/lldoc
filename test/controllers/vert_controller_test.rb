require 'test_helper'

class VertControllerTest < ActionController::TestCase
  test "should get ls" do
    get :ls
    assert_response :success
  end

  test "should get mkdir" do
    get :mkdir
    assert_response :success
  end

  test "should get rm" do
    get :rm
    assert_response :success
  end

end
