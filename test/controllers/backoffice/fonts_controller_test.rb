# frozen_string_literal: true

require "test_helper"

class Backoffice::FontsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @font = fonts(:serif)
  end

  test "should get index" do
    get backoffice_fonts_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_font_url
    assert_response :success
  end

  test "should create font" do
    assert_difference("Font.count") do
      params = { font: { name: "Commic Sans" } }
      post backoffice_fonts_url, params: params
    end

    assert_redirected_to backoffice_font_url(Font.last)
  end

  test "should show font" do
    get backoffice_font_url(@font)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_font_url(@font)
    assert_response :success
  end

  test "should update font" do
    params = { font: { name: "Commic Sans Bold" } }
    patch backoffice_font_url(@font), params: params
    assert_redirected_to backoffice_font_url(@font)
  end

  test "should destroy font" do
    assert_difference("Font.count", -1) do
      delete backoffice_font_url(@font)
    end

    assert_redirected_to backoffice_fonts_url
  end
end
