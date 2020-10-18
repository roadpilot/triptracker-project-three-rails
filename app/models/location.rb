class Location < ApplicationRecord
    belongs_to :user
    has_many :trip_locations
    has_many :trips, through: :trip_locations
    validates :address, presence: true

    # SCOPE METHOD FOR DATALIST SO THAT ONLY DISTINCT ADDRESSES ARE RETURNED
    scope :address_only, -> { select(:address).distinct } 

end
