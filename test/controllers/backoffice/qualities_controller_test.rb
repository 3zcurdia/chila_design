# frozen_string_literal: true

require "test_helper"

class Backoffice::QualitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quality = qualities(:formality)
  end

  test "should get index" do
    get backoffice_qualities_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_quality_url
    assert_response :success
  end

  test "should create quality" do
    assert_difference("Quality.count") do
      params = { quality: { name: "Stren", antithesis: "weak", thesis: "strong" } }
      post backoffice_qualities_url, params: params
    end

    assert_redirected_to backoffice_quality_url(Quality.last)
  end

  test "should show quality" do
    get backoffice_quality_url(@quality)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_quality_url(@quality)
    assert_response :success
  end

  test "should update quality" do
    params = { quality: { name: "Strenth" } }
    patch backoffice_quality_url(@quality), params: params
    assert_redirected_to backoffice_quality_url(@quality)
  end

  test "should destroy quality" do
    assert_difference("Quality.count", -1) do
      delete backoffice_quality_url(@quality)
    end

    assert_redirected_to backoffice_qualities_url
  end
end
