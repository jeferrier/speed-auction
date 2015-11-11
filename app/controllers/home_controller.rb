class HomeController < ApplicationController
  before_action :show_sign_in

  def index
    @auctions = Auction.all
    @current_auction = []
    @current_item = []
    @auctions.each do |a|
      if a.begin_date <= DateTime.now && a.end_date > DateTime.now
        @current_auction << a
        @current_item << a.item
      end
    end
  end

  def login

    if params[:sign_in_username].blank? && params[:sign_up_username].blank?
      puts "Cannot log in or sign up with no username."
    elsif params[:sign_up_username].blank?
      #trying to log in

      user = User.find_by(username: params[:sign_in_username])

      if user.nil?
      else
        user.log_in
        session[:user_cred] = user.session_id
      end

    elsif params[:sign_in_username].blank?
      #trying to sign up

      user = User.create(
        username: params[:sign_up_username],
        password: params[:sign_up_password],
        password_confirmation: params[:sign_up_confirm_password]
        )
      user.log_in
      session[:user_cred] = user.session_id

    end
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
