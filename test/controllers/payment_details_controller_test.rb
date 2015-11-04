require 'test_helper'

class PaymentDetailsControllerTest < ActionController::TestCase
  setup do
    @payment_detail = payment_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_detail" do
    assert_difference('PaymentDetail.count') do
      post :create, payment_detail: { credit_card: @payment_detail.credit_card, credit_card_expiration_date: @payment_detail.credit_card_expiration_date, credit_card_number: @payment_detail.credit_card_number, credit_card_security_code: @payment_detail.credit_card_security_code, paypal: @payment_detail.paypal, paypal_email_address: @payment_detail.paypal_email_address }
    end

    assert_redirected_to payment_detail_path(assigns(:payment_detail))
  end

  test "should show payment_detail" do
    get :show, id: @payment_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_detail
    assert_response :success
  end

  test "should update payment_detail" do
    patch :update, id: @payment_detail, payment_detail: { credit_card: @payment_detail.credit_card, credit_card_expiration_date: @payment_detail.credit_card_expiration_date, credit_card_number: @payment_detail.credit_card_number, credit_card_security_code: @payment_detail.credit_card_security_code, paypal: @payment_detail.paypal, paypal_email_address: @payment_detail.paypal_email_address }
    assert_redirected_to payment_detail_path(assigns(:payment_detail))
  end

  test "should destroy payment_detail" do
    assert_difference('PaymentDetail.count', -1) do
      delete :destroy, id: @payment_detail
    end

    assert_redirected_to payment_details_path
  end
end
