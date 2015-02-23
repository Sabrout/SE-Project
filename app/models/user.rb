class User < ActiveRecord::Base
has_secure_password
validates :uname , :password , :fname , :lname , :email ,:presence => true
end
