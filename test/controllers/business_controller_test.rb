require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_index_url
    assert_response :success
  end

  test "should get new" do
    get business_new_url
    assert_response :success
  end

  test "should get create" do
    get business_create_url
    assert_response :success
  end

  test "should get edit" do
    get business_edit_url
    assert_response :success
  end

  test "should get update" do
    get business_update_url
    assert_response :success
  end

  test "should get destroy" do
    get business_destroy_url
    assert_response :success
  end

end
