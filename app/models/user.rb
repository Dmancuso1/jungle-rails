class User < ActiveRecord::Base

  #gives User model authentication methods via bcrypt
  has_secure_password 

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :update

  def self.authenticate_with_credentials(email, password)
    stripped = email.strip
    user = User.find_by_email(stripped)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
