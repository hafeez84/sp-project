require 'test_helper'

class Api::TriangleControllerTest < ActionDispatch::IntegrationTest
  test "should get type" do
    get api_triangle_type_url
    assert_response :success
  end

end
