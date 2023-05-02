require 'test_helper'

class AddAddressToUsersControllerTest < ActionController::TestCase
  test "should get address:string" do
    get :address:string
    assert_response :success
  end

end
