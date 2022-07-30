# frozen_string_literal: true

require "test_helper"

class Api::BusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = api_businesses(:one)
  end

  test "should get index" do
    get api_businesses_url
    assert_response :success
  end

  test "should get new" do
    get new_api_business_url
    assert_response :success
  end

  test "should create api_business" do
    assert_difference("Api::Business.count") do
      post api_businesses_url, params: { api_business: {} }
    end

    assert_redirected_to api_business_url(Api::Business.last)
  end

  test "should show api_business" do
    get api_business_url(@business)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_business_url(@business)
    assert_response :success
  end

  test "should update api_business" do
    patch api_business_url(@business), params: { api_business: {} }
    assert_redirected_to api_business_url(@business)
  end

  test "should destroy api_business" do
    assert_difference("Api::Business.count", -1) do
      delete api_business_url(@business)
    end

    assert_redirected_to api_businesses_url
  end
end
