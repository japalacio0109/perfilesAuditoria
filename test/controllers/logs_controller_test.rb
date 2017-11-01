require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  test "should get system" do
    get logs_system_url
    assert_response :success
  end

  test "should get auditDB" do
    get logs_auditDB_url
    assert_response :success
  end

end
