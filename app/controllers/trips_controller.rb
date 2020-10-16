class TripsController < ApplicationController
    def new
        @trip = Trip.new
    end
    def index
        @trips = current_user.trips
    end
end
