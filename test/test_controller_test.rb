require 'test_helper'

class TestControllerTest < ActionController::TestCase

  def test_rendering_html
    get :basic, :format => :html
    assert_response :success

    assert_select "h1", :text => "HTML"
    assert_select "h2", :text => "Shared"
    assert_select "h3", :text => "HTML"
  end

  def test_rendering_mobile
    get :basic, :format => :mobile
    assert_response :success
    
    assert_select "h1", :text => "Mobile"
    assert_select "h2", :text => "Shared"
    assert_select "h3", :text => "Mobile"
  end

end