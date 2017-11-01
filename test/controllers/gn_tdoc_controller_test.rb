require 'test_helper'

class GnTdocControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gn_tdoc_index_url
    assert_response :success
  end

end
