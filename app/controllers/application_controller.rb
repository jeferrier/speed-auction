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
end
