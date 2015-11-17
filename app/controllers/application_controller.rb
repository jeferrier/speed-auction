class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show_sign_in
    if session[:user_cred].blank?
      @show_sign_in = true
    else
      @show_sign_in = false
    end
  end

  def application_login
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
  end
end
