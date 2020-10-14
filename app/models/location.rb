class Location < ApplicationRecord
    belongs_to :user
    belongs_to :trip
    has_many :comments
    has_many :trips, through: :trip_locations
end
