class User < ApplicationRecord
    has_many :trips
    # has_many :comments
    has_secure_password
end
