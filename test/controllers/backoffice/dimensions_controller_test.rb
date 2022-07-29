# frozen_string_literal: true

require "test_helper"

class Backoffice::DimensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color = colors(:red)
    @color.save
    @quality = qualities(:sentiment)
    @quality.save
    @dimension = Dimension.new(quality: @quality, dimensionable: @color, value: 6.5)
  end

  test "should get index" do
    get backoffice_dimensions_url(dimensionable_id: @color.id)
    assert_response :success
  end

  # test "should get new" do
  #   get new_backoffice_dimension_url(dimensionable_id: @color.id)
  #   assert_response :success
  # end

  # test "should create dimension" do
  #   assert_difference("Dimension.count") do
  #     post backoffice_dimensions_url(dimensionable_id: @color.id), params: { dimension: {} }
  #   end
  # end

  # test "should show dimension" do
  #   get backoffice_dimension_url(@dimension)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_backoffice_dimension_url(@dimension)
  #   assert_response :success
  # end

  # test "should update dimension" do
  #   patch backoffice_dimension_url(@dimension), params: { dimension: {} }
  #   assert_redirected_to backoffice_dimension_url(@dimension)
  # end

  # test "should destroy dimension" do
  #   assert_difference("Dimension.count", -1) do
  #     delete backoffice_dimension_url(@dimension)
  #   end

  #   assert_redirected_to backoffice_dimensions_url
  # end
end
