require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get category_show_url
    assert_response :success
  end

end
