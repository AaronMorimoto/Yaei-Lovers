require "test_helper"

class Admin::EnvironmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_environments_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_environments_edit_url
    assert_response :success
  end
end
