require 'test_helper'

class MyaccountControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit_payment_details" do
    get :edit_payment_details
    assert_response :success
  end

  test "should get edit_login_details" do
    get :edit_login_details
    assert_response :success
  end

  test "should get view_payment_history" do
    get :view_payment_history
    assert_response :success
  end

end
