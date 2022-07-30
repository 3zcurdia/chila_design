require "application_system_test_case"

class Api::CompetitorsTest < ApplicationSystemTestCase
  setup do
    @competitor = api_competitors(:one)
  end

  test "visiting the index" do
    visit api_competitors_url
    assert_selector "h1", text: "Competitors"
  end

  test "should create competitor" do
    visit api_competitors_url
    click_on "New competitor"

    click_on "Create Competitor"

    assert_text "Competitor was successfully created"
    click_on "Back"
  end

  test "should update Competitor" do
    visit api_competitor_url(@competitor)
    click_on "Edit this competitor", match: :first

    click_on "Update Competitor"

    assert_text "Competitor was successfully updated"
    click_on "Back"
  end

  test "should destroy Competitor" do
    visit api_competitor_url(@competitor)
    click_on "Destroy this competitor", match: :first

    assert_text "Competitor was successfully destroyed"
  end
end
