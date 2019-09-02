require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participations_new_url
    assert_response :success
  end

end
