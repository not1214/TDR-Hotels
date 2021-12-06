require 'test_helper'

class Admin::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get hotel_search" do
    get admin_searches_hotel_search_url
    assert_response :success
  end

  test "should get category_search" do
    get admin_searches_category_search_url
    assert_response :success
  end

  test "should get area_search" do
    get admin_searches_area_search_url
    assert_response :success
  end

end
