class Location < ApplicationRecord
    belongs_to :user, optional: true
    # belongs_to :trip, optional: true
    # has_many :comments
    has_many :trip_locations
    has_many :trips, through: :trip_locations
    validates :address, presence: true

    scope :address_only, -> { select(:address).distinct } 

end
