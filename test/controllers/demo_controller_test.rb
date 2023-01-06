require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get demo_show_url
    assert_response :success
  end
end
