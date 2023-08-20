require "test_helper"

class Publoc::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publoc_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get publoc_users_edit_url
    assert_response :success
  end
end
