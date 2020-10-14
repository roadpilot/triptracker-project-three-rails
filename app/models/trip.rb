class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :locations, through: :trip_locations
end
