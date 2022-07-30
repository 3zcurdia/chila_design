require "test_helper"

class Api::QualitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quality = api_qualities(:one)
  end

  test "should get index" do
    get api_qualities_url
    assert_response :success
  end

  test "should get new" do
    get new_api_quality_url
    assert_response :success
  end

  test "should create api_quality" do
    assert_difference("Api::Quality.count") do
      post api_qualities_url, params: { api_quality: {  } }
    end

    assert_redirected_to api_quality_url(Api::Quality.last)
  end

  test "should show api_quality" do
    get api_quality_url(@quality)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_quality_url(@quality)
    assert_response :success
  end

  test "should update api_quality" do
    patch api_quality_url(@quality), params: { api_quality: {  } }
    assert_redirected_to api_quality_url(@quality)
  end

  test "should destroy api_quality" do
    assert_difference("Api::Quality.count", -1) do
      delete api_quality_url(@quality)
    end

    assert_redirected_to api_qualities_url
  end
end
