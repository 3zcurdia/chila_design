# frozen_string_literal: true

require "test_helper"

class Backoffice::DimensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dimension = dimensions(:one)
  end

  test "should get index" do
    get backoffice_dimensions_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_dimension_url
    assert_response :success
  end

  test "should create dimension" do
    assert_difference("Dimension.count") do
      post backoffice_dimensions_url, params: { dimension: {} }
    end

    assert_redirected_to backoffice_dimension_url(Dimension.last)
  end

  test "should show dimension" do
    get backoffice_dimension_url(@dimension)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_dimension_url(@dimension)
    assert_response :success
  end

  test "should update dimension" do
    patch backoffice_dimension_url(@dimension), params: { dimension: {} }
    assert_redirected_to backoffice_dimension_url(@dimension)
  end

  test "should destroy dimension" do
    assert_difference("Dimension.count", -1) do
      delete backoffice_dimension_url(@dimension)
    end

    assert_redirected_to backoffice_dimensions_url
  end
end
