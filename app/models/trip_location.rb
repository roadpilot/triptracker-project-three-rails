class TripLocation < ApplicationRecord
  # JOIN TABLE BETWEEN TRIPS AND LOCATIONS
  belongs_to :trip
  belongs_to :location
end
