require 'test_helper'

class GnTusuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gn_tusu_index_url
    assert_response :success
  end

end
