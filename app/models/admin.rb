class Admin < ActiveRecord::Base
  has_secure_password

  def log_in
   admin = Admin.find_by(self.id)

    # Not a real credential
    if admin.nil?
      puts "Cannot login admin: admin not in database"
      return
    else
      
      # Admin has never logged in before
      # or
      # Admin logged in previously, but the session has expired
      if admin.session_expires.nil? || admin.session_expires < Time.now
        update_credentials_for_admin
        return
      end
    end
  end

  def logged_in?
    admin = Admin.find_by(id: self.id)

    # Not a real credential
    if admin.nil?
      return false
    else
      
      # Admin has never logged in before
      if admin.session_expires.nil?
        return false
      else

        # Admin logged in previously, but the session has expired
        if admin.session_expires < Time.now
          return false
        else
          return true
        end
      end
    end
  end

  def update_credentials_for_admin
    admin = Admin.find_by(self.id)

    expires = Time.now + 1.hour

    if admin.nil?
      puts "Cannot login admin: admin not in database"
      return
    elsif self.username.nil?
      puts "Cannot login admin: missing a username"
      return
    elsif self.password_digest.nil?
      puts "Cannot login admin: missing a password"
      return
    else

      message = self.username + expires.to_s
      credential = Digest::MD5.hexdigest message

      self.session_expires = expires
      self.session_id = credential

    end
    save!
  end
end
