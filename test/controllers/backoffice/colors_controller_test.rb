# frozen_string_literal: true

require "test_helper"

class Backoffice::ColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color = colors(:red)
  end

  test "should get index" do
    get backoffice_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_color_url
    assert_response :success
  end

  test "should create color" do
    assert_difference("Color.count") do
      params = { color: { name: "Solid Red", value: "#AA0000" } }
      post backoffice_colors_url, params: params
    end

    assert_redirected_to backoffice_color_url(Color.last)
  end

  test "should show color" do
    get backoffice_color_url(@color)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_color_url(@color)
    assert_response :success
  end

  test "should update color" do
    params = { color: { value: "Just Red" } }
    patch backoffice_color_url(@color), params: params
    assert_redirected_to backoffice_color_url(@color)
  end

  test "should destroy color" do
    assert_difference("Color.count", -1) do
      delete backoffice_color_url(@color)
    end

    assert_redirected_to backoffice_colors_url
  end
end
