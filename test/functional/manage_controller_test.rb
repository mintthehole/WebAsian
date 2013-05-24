require 'test_helper'

class ManageControllerTest < ActionController::TestCase
  test "should get request_new_page" do
    get :request_new_page
    assert_response :success
  end

  test "should get update_page" do
    get :update_page
    assert_response :success
  end

  test "should get delete_page" do
    get :delete_page
    assert_response :success
  end

  test "should get change_plan" do
    get :change_plan
    assert_response :success
  end

  test "should get create_form" do
    get :create_form
    assert_response :success
  end

  test "should get add_feed" do
    get :add_feed
    assert_response :success
  end

end
