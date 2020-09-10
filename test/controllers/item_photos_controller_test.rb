require 'test_helper'

class ItemPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get item_photos_create_url
    assert_response :success
  end

end
