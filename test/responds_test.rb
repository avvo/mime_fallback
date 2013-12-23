require 'test_helper'

class MimeTypeFallbackTest < ActionDispatch::IntegrationTest
  def test_respond_to_basic
    get "/test/responding.json"
    assert_response :success
    resp = JSON.parse(@response.body)
    assert_equal "json", resp["format"]
    assert_equal "application/json", resp["string"]
  end

  def test_respond_to_fallbacks
    get "/test/responding.mobilejson"
    assert_response :success
    resp = JSON.parse(@response.body)
    assert_equal "mobilejson", resp["format"]
    assert_equal "application/json", resp["string"]
  end
end