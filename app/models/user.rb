class User < ApplicationRecord

    has_many :trips
    has_many :locations
    has_secure_password
    #password is validated thru "has_secure_password"
    validates :handle, :email, presence: true
    validates :email, :handle, uniqueness: true
    #restricts users from signing up with a blank or existing user handle or email

end
