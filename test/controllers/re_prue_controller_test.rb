require 'test_helper'

class RePrueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get re_prue_index_url
    assert_response :success
  end

  test "should get new" do
    get re_prue_new_url
    assert_response :success
  end

  test "should get edit" do
    get re_prue_edit_url
    assert_response :success
  end

  test "should get show" do
    get re_prue_show_url
    assert_response :success
  end

end
