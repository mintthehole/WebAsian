require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test "should get real_time" do
    get :real_time
    assert_response :success
  end

  test "should get traffic_source" do
    get :traffic_source
    assert_response :success
  end

  test "should get seo" do
    get :seo
    assert_response :success
  end

  test "should get social" do
    get :social
    assert_response :success
  end

  test "should get page_statistics" do
    get :page_statistics
    assert_response :success
  end

end
