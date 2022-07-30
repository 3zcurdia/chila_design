# frozen_string_literal: true

require "application_system_test_case"

class Api::DimensionsTest < ApplicationSystemTestCase
  setup do
    @dimension = api_dimensions(:one)
  end

  test "visiting the index" do
    visit api_dimensions_url
    assert_selector "h1", text: "Dimensions"
  end

  test "should create dimension" do
    visit api_dimensions_url
    click_on "New dimension"

    click_on "Create Dimension"

    assert_text "Dimension was successfully created"
    click_on "Back"
  end

  test "should update Dimension" do
    visit api_dimension_url(@dimension)
    click_on "Edit this dimension", match: :first

    click_on "Update Dimension"

    assert_text "Dimension was successfully updated"
    click_on "Back"
  end

  test "should destroy Dimension" do
    visit api_dimension_url(@dimension)
    click_on "Destroy this dimension", match: :first

    assert_text "Dimension was successfully destroyed"
  end
end
