class MyaccountController < ApplicationController
  before_action :show_sign_in
  
  def index
    if @show_sign_in
      redirect_to root_path
    else
      if @admin == nil
        @payment_details = @user.payment_details
      end
    end   
  end

  def view_payment_history
  end

end