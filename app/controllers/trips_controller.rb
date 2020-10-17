class TripsController < ApplicationController
    def new
        @trip = Trip.new
        @trip.locations.build(business_name: "blank")
    end
    def index
        @trips = current_user.trips
    end
    def show
        @trip = Trip.find_by(id: params[:id])
        @location = Location.new
        # binding.pry
        # @trip.trip_locations.build(trip_id: params[:id])
    end

    def create
        @location = current_user.locations.find_or_create_by(address: trip_params[:locations_attributes][:address])
        # binding.pry
        # @trip = current_user.trips.create(name: trip_params[:name]).trip_locations.create(location_id: @location.id)
        @trip = current_user.trips.create(name: trip_params[:name])
        @trip.trip_locations.create(location_id: @location.id)
        redirect_to trip_path(@trip)
    end

    def update
        # binding.pry
        @location = Location.find_or_create_by(address: trip_params[:locations_attributes][:address])
        @trip = current_user.trips.find_by(id: params[:id])
        @trip.trip_locations.create!(location_id: @location.id)
        redirect_to trip_path(@trip)
    end

    def trip_params
    params.require(:trip).permit(
      :name,
      locations_attributes: [
        :address
      ]
    )
    end
end
