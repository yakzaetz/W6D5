#require?

class User < ApplicationRecord

after_initialize :ensure_token


validates :username, presence: true, uniqueness: true
validates :password, length: { minimum: 6, allow_nil: true }
# password not in database, need to allow nil because password is nil when reset_session_token is called and saved, password = nil (NULL)
# validates


def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)    
    if user && user.is_password?(password) 
        ## work w/o "user &&"?
        user
    else 
        nil
    end
end


def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password) # create to save in db, persists 
end

# self.password_digest.is_password?(password) is not possible because BCrypt needs to check match in private 

def is_password?(password)  # aka #check_password      
    mock_password = BCrypt::Password.new(self.password_digest) # new to make an instance, does not persist
    mock_password.is_password?(password) #is_password is a BCrypt method
end


def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!  # save to db updated class instance
    self.session_token
end

def ensure_token
    self.session_token ||= SecureRandom::urlsafe_base64
end





end