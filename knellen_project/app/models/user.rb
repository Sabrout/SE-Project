class User < ActiveRecord::Base
	attr_accessor :remember_token
	self.table_name = 'users'
	has_secure_password

def remember # call the new token function to generate the string and then call the digest to hash that string
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
end

def User.new_token  # create a random string
    SecureRandom.urlsafe_base64
end

def User.digest(string) # hash the string (the token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
end

def authenticated?(remember_token) #used to make sure that the token matches the hashed one in db
    if remember_digest.nil?
    	return false
    else
   
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end

def forget
    update_attribute(:remember_digest, nil)
end

end
