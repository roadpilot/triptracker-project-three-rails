class User < ApplicationRecord
    has_many :trips
    has_many :locations
    # has_many :comments
    has_secure_password
    #password is validated thru "has_secure_password"
    validates :handle, :email, presence: true
    #restricts users from signing up with an existing user handle or email
    validates :email, :handle, uniqueness: true

end
