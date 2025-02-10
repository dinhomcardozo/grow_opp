require "test_helper"

class LicensesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get licenses_new_url
    assert_response :success
  end

  test "should get edit" do
    get licenses_edit_url
    assert_response :success
  end

  test "should get index" do
    get licenses_index_url
    assert_response :success
  end

  test "should get create" do
    get licenses_create_url
    assert_response :success
  end

  test "should get update" do
    get licenses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get licenses_destroy_url
    assert_response :success
  end
end
