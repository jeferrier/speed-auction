class MyaccountController < ApplicationController
  before_action :show_sign_in
  
  def index
    if @show_sign_in
      redirect_to root_path
    end
    @payment_details = @user.payment_details
  end

  def view_payment_history
  end

end