require 'test_helper'

class HommeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homme_index_url
    assert_response :success
  end

end
