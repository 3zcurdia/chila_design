require "application_system_test_case"

class Api::BusinessesTest < ApplicationSystemTestCase
  setup do
    @business = api_businesses(:one)
  end

  test "visiting the index" do
    visit api_businesses_url
    assert_selector "h1", text: "Businesses"
  end

  test "should create business" do
    visit api_businesses_url
    click_on "New business"

    click_on "Create Business"

    assert_text "Business was successfully created"
    click_on "Back"
  end

  test "should update Business" do
    visit api_business_url(@business)
    click_on "Edit this business", match: :first

    click_on "Update Business"

    assert_text "Business was successfully updated"
    click_on "Back"
  end

  test "should destroy Business" do
    visit api_business_url(@business)
    click_on "Destroy this business", match: :first

    assert_text "Business was successfully destroyed"
  end
end
