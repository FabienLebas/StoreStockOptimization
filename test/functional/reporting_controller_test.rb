require 'test_helper'

class ReportingControllerTest < ActionController::TestCase
  test "should get best_sellers" do
    get :best_sellers
    assert_response :success
  end

  test "should get slow_movers" do
    get :slow_movers
    assert_response :success
  end

  test "should get end_life" do
    get :end_life
    assert_response :success
  end

end
