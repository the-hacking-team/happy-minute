# frozen_string_literal: true

require 'test_helper'

class BusinessPhotosControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get business_photos_create_url
    assert_response :success
  end
end
