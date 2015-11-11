class HomeController < ApplicationController
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

    if params[:sign_in_username].nil? && params[:sign_up_username].nil?
      puts "Cannot log in or sign up with no username."
    elsif params[:sign_up_username].nil?
      #trying to log in

      user = User.find_by(username: params[:sign_in_username])
      puts "Found user: " + user.username

      if user.nil?
      else
        user.log_in
      end

    elsif params[:sign_in_username].nil?
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
end
