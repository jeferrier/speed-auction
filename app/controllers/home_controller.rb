class HomeController < ApplicationController
  before_action :show_sign_in

  def index
    @auctions = Auction.all
    @current_auction = nil
    @current_item = nil
    @auctions.each do |a|
      if a.begin_date <= DateTime.now && a.end_date > DateTime.now
        @current_auction = a
        @current_item = a.item
      end
    end
  end

  def login
    application_login
    redirect_to root_path
  end

  def logout

    unless session[:user_cred].blank?
      user = User.find_by(session_id: session[:user_cred])

      if user.nil?
        #they're already logged out????
      else
        user.session_id = nil
        user.session_expires = nil
        user.save
      end
    end
    session[:user_cred] = nil
    redirect_to root_path
  end
end
