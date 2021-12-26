require 'test_helper'

class Admin::HotelsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_hotels_index_url
    assert_response :success
  end

  test 'should get new' do
    get admin_hotels_new_url
    assert_response :success
  end

  test 'should get show' do
    get admin_hotels_show_url
    assert_response :success
  end

  test 'should get edit' do
    get admin_hotels_edit_url
    assert_response :success
  end
end
