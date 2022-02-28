require "test_helper"

class PostersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posters_new_url
    assert_response :success
  end

  test "should get create" do
    get posters_create_url
    assert_response :success
  end

  test "should get show" do
    get posters_show_url
    assert_response :success
  end

  test "should get print" do
    get posters_print_url
    assert_response :success
  end

  test "should get mark_as_found" do
    get posters_mark_as_found_url
    assert_response :success
  end

  test "should get index" do
    get posters_index_url
    assert_response :success
  end
end
