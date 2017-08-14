require 'test_helper'

class FootballControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get football_index_url
    assert_response :success
  end

end
