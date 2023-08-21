require "test_helper"

class Public::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get public_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_posts_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_posts_create_url
    assert_response :success
  end

  test "should get update" do
    get public_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_posts_destroy_url
    assert_response :success
  end
end
