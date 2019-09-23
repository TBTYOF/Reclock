require 'test_helper'

class Users::CardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_card_new_url
    assert_response :success
  end

  test "should get show" do
    get users_card_show_url
    assert_response :success
  end

end
