class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show_sign_in
    @show_sign_in = false
    puts "Checking to see if someone is signed in"

    if session[:user_cred].blank?
      @show_sign_in = true
      puts "User Credential is blank in session, not logged in"
    else

      user = User.find_by(session_id: session[:user_cred])
      if user == nil
        puts "User Credential in session, user not found\nTrying Admin..."
        user = Admin.find_by(session_id: session[:user_cred])

        if user == nil
          @show_sign_in = true
          puts "User Credential in session, no user or Admin found."

        else 
          puts"Check to see if admin is logged in: " + user.logged_in?.to_s
          @show_sign_in = !user.logged_in?
          puts "@show_sign_in = " + @show_sign_in.to_s

          unless @show_sign_in
            @admin = user
          end

        end

      else
        puts"Check to see if user is logged in: " + user.logged_in?.to_s
        @show_sign_in = !user.logged_in?
        puts "@show_sign_in = " + @show_sign_in.to_s

        unless @show_sign_in
          @user = user
        end

      end

    end

    @show_sign_in
  end

  def application_login
    if params[:sign_in_username].blank? && params[:sign_up_username].blank?
      puts "Cannot log in or sign up with no username."
    elsif params[:sign_up_username].blank?
      #trying to log in

      puts "Trying to sign in User..."
      user = User.find_by(username: params[:sign_in_username])

      if user == nil

        puts "No User found.\nTrying to sign in Admin..."

        user = Admin.find_by(username: params[:sign_in_username])

        if user == nil
          puts "No Admin found."
        else
          user.log_in
          session[:user_cred] = user.session_id
        end

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
