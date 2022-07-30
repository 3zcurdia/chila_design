require "test_helper"

class Api::CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competitor = api_competitors(:one)
  end

  test "should get index" do
    get api_competitors_url
    assert_response :success
  end

  test "should get new" do
    get new_api_competitor_url
    assert_response :success
  end

  test "should create api_competitor" do
    assert_difference("Api::Competitor.count") do
      post api_competitors_url, params: { api_competitor: {  } }
    end

    assert_redirected_to api_competitor_url(Api::Competitor.last)
  end

  test "should show api_competitor" do
    get api_competitor_url(@competitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_competitor_url(@competitor)
    assert_response :success
  end

  test "should update api_competitor" do
    patch api_competitor_url(@competitor), params: { api_competitor: {  } }
    assert_redirected_to api_competitor_url(@competitor)
  end

  test "should destroy api_competitor" do
    assert_difference("Api::Competitor.count", -1) do
      delete api_competitor_url(@competitor)
    end

    assert_redirected_to api_competitors_url
  end
end
