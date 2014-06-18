require 'test_helper'

class Api::ApiControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
