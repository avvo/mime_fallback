require 'test_helper'

class RespondsTest < ActionDispatch::IntegrationTest
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

  def test_respond_to_mobile_only
    get "/test/mobile_only.mobile"
    assert_response :success

    assert_raises ActionController::UnknownFormat do
      get "/test/mobile_only.html"
    end
  end

  def test_respond_to_html_only_with_mobile_request
    get "/test/html_only.html"
    assert_response :success

    # mobile is a more specific type of html, fallback
    get "/test/html_only.mobile"
    assert_response :success
  end
end