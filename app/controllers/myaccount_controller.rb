class MyaccountController < ApplicationController
  before_action :show_sign_in
  def index
    @user = User.find_by(session_id: session[:user_cred])
    @payment_details = @user.payment_details
  end

  #def edit_login_details
  #end

  #def view_payment_history
  #end
end