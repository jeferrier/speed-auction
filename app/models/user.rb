class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :payment_details
  has_many :items


  def log_in
   user = User.find_by(self.id)

    # Not a real credential
    if user.nil?
      puts "Cannot login user: user not in database"
      return
    else
      
      # User has never logged in before
      # or
      # User logged in previously, but the session has expired
      if user.session_expires.nil? || user.session_expires < Time.now
        update_credentials_for_user
        return
      end
    end
  end

  def logged_in?
    user = User.find_by(self.id)

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

  def update_credentials_for_user
    user = User.find_by(self.id)

    expires = Time.now + 1.hour

    if user.nil?
      puts "Cannot login user: user not in database"
      return
    elsif self.username.nil?
      puts "Cannot login user: missing a username"
      return
    elsif self.password_digest.nil?
      puts "Cannot login user: missing a password"
      return
    else

      message = self.username + expires.to_s
      credential = Digest::MD5.hexdigest message

      self.session_expires = expires
      self.session_id = credential

    end

    self.save

  end
end
