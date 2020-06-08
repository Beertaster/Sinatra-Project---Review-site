class User < ActiveRecord::Base
    has_many :posts
    has_secure_password
  
    #def authenticate(string)
      #compares the string to the encyrpted password and returns either false or the instance of the user again (true)
    #end
    
    # def password=(string)
    #   encrypted_pw = BCrypt::Password.create(string)
    #   self.password_digest = encrypted_pw
    # end

    validates :name, presence: true
    validates :password, presence: true
    validates :password, uniqueness: true
  end