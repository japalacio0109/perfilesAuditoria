require 'test_helper'

class GnTercControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gn_terc_index_url
    assert_response :success
  end

  test "should get new" do
    get gn_terc_new_url
    assert_response :success
  end

  test "should get edit" do
    get gn_terc_edit_url
    assert_response :success
  end

  test "should get show" do
    get gn_terc_show_url
    assert_response :success
  end

end
