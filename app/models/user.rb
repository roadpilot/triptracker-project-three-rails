class User < ApplicationRecord
    has_many :trips
    has_many :locations
    # has_many :comments
    has_secure_password
end
