require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get user_deleted" do
    get public_user_deleted_url
    assert_response :success
  end
end
