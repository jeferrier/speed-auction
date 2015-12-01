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
    @purchased_paid_auctions = Auction.where('end_date < ?',DateTime.now).where('bidder_id = ?', @user.id).where('paid = ?', true)
    @purchased_pending_auctions = Auction.where('end_date < ?',DateTime.now).where('bidder_id = ?', @user.id).where('paid = ?', false)
    @paid_amount = 0
    @pending_amount = 0
    @purchased_paid_auctions.each do |auction|
      @paid_amount = @paid_amount + auction.current_bid
    end
    @purchased_pending_auctions.each do |auction|
      @pending_amount = @pending_amount + auction.current_bid
    end
  end

end