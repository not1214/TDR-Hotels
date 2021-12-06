require 'test_helper'

class Public::PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_pictures_index_url
    assert_response :success
  end

end
