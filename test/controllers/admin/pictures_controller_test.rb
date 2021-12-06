require 'test_helper'

class Admin::PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pictures_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_pictures_new_url
    assert_response :success
  end

end
