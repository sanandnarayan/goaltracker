require 'test_helper'

class CalendarControllerTest < ActionController::TestCase
  test "should get events" do
    get :events
    assert_response :success
  end

end
