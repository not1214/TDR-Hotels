require 'test_helper'

class Public::AreasControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get public_areas_show_url
    assert_response :success
  end
end
