require 'test_helper'

class BusinessQrCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get business_qr_codes_show_url
    assert_response :success
  end

end
