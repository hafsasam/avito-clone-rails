require 'test_helper'

class UtilisateursControllerTest < ActionController::TestCase
  test "should get nouveau" do
    get :nouveau
    assert_response :success
  end

end
