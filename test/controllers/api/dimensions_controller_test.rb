# frozen_string_literal: true

require "test_helper"

class Api::DimensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dimension = api_dimensions(:one)
  end

  test "should get index" do
    get api_dimensions_url
    assert_response :success
  end

  test "should get new" do
    get new_api_dimension_url
    assert_response :success
  end

  test "should create api_dimension" do
    assert_difference("Api::Dimension.count") do
      post api_dimensions_url, params: { api_dimension: {} }
    end

    assert_redirected_to api_dimension_url(Api::Dimension.last)
  end

  test "should show api_dimension" do
    get api_dimension_url(@dimension)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_dimension_url(@dimension)
    assert_response :success
  end

  test "should update api_dimension" do
    patch api_dimension_url(@dimension), params: { api_dimension: {} }
    assert_redirected_to api_dimension_url(@dimension)
  end

  test "should destroy api_dimension" do
    assert_difference("Api::Dimension.count", -1) do
      delete api_dimension_url(@dimension)
    end

    assert_redirected_to api_dimensions_url
  end
end
