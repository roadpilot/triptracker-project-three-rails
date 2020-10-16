class TripsController < ApplicationController
    def new
        @trip = Trip.new
    end
    def index
        @trips = current_user.trips
    end
    def show
        @trip = Trip.find_by(id: params[:id])
        # binding.pry
    end
end
