require 'test_helper'

class BusinessFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get business_follows_create_url
    assert_response :success
  end

end
