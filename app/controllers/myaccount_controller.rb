class MyaccountController < ApplicationController
  before_action :show_sign_in
  
  def index
    if @show_sign_in
      redirect_to root_path
    end
    @user = User.find_by(session_id: session[:user_cred])
    @payment_details = @user.payment_details
  end

  def view_payment_history
  end

end