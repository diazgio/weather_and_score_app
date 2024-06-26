require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get weather" do
    get home_weather_url
    assert_response :success
  end

  test "should get score" do
    get home_score_url
    assert_response :success
  end
end
