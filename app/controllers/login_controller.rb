require 'digest'  # For MD5

class LoginController < ApplicationController
  before_action :authorize_user_for_access
  skip_before_action :authorize_user_for_access, \
      only: [:verify_login, :login]

  # Uncomment this next line when uploading to heroku
  #  Important note:
  #  This will still not work, because heroku requires special setup
  #  And we need an ssl cert
  #  But, we will add an exception for *.herokuapp.com
  #  And not use an SSL cert
  #   ONLY DO THIS FOR SMALL NUMBER OF USERS i.e users < 5
  #   Because certs and ssl on heroku cost money!

  #force_ssl

  def home
  end

  def login
  end

  def verify_login
    #verify user login
    user = User.find_by(username: params[:username])

    if user and user.authenticate(params[:password])

      #set up a session for this user
      reset_session
      update_credentials_for_user(user)
      #send them to the home page for admin
      redirect_to admin_path

    else
      redirect_to admin_login_path
    end
  end

  def logout
    reset_session
  end

  # before_actions
  def authorize_user_for_access
    unless user_logged_in?
      redirect_to admin_login_path
    else
      update_credentials_for_user(nil)
    end
  end

  # helper actions
  def user_logged_in?
    user = User.find_by(session_id: session[:user_cred])

    # Not a real credential
    if user.nil?
      return false
    else
      
      # User has never logged in before
      if user.session_expires.nil?
        return false
      else

        # User logged in previously, but the session has expired
        if user.session_expires < Time.now
          return false
        else
          return true
        end
      end
    end
  end

  def update_credentials_for_user(user)

    expires = Time.now + 1.hour

    if user.nil?

      user = User.find_by(session_id: session[:user_cred])

      user.session_expires = expires

    else

      message = user.username + expires.to_s
      credential = Digest::MD5.hexdigest message

      user.session_expires = expires
      user.session_id = credential

    end

    user.save

  end
end
