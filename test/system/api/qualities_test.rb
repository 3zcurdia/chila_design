require "application_system_test_case"

class Api::QualitiesTest < ApplicationSystemTestCase
  setup do
    @quality = api_qualities(:one)
  end

  test "visiting the index" do
    visit api_qualities_url
    assert_selector "h1", text: "Qualities"
  end

  test "should create quality" do
    visit api_qualities_url
    click_on "New quality"

    click_on "Create Quality"

    assert_text "Quality was successfully created"
    click_on "Back"
  end

  test "should update Quality" do
    visit api_quality_url(@quality)
    click_on "Edit this quality", match: :first

    click_on "Update Quality"

    assert_text "Quality was successfully updated"
    click_on "Back"
  end

  test "should destroy Quality" do
    visit api_quality_url(@quality)
    click_on "Destroy this quality", match: :first

    assert_text "Quality was successfully destroyed"
  end
end
