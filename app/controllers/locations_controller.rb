class LocationsController < ApplicationController
    def create
        # binding.pry
        # @location = current_user.locations.find_or_create_by(address: location_params[:address])
        @location = Location.find_or_create_by(address: location_params[:address]) do |u|
            u.user_id = current_user.id
        end
        # binding.pry
        # @trip = current_user.trips.create(name: trip_params[:name]).trip_locations.create(location_id: @location.id)
        @trip = Trip.find_by(id: location_params[:trip_id])
        @trip.trip_locations.create(location_id: @location.id)
        redirect_to trip_path(@trip)
    end

    def location_params
    params.require(:location).permit(
      :address,
      :trip_id
    )
    end
end
