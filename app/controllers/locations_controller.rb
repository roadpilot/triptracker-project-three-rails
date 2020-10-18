class LocationsController < ApplicationController
  before_action :require_logged_in

    # CREATE LOCATION FROM TRIP
    def create
        if location_params[:address].strip == ""
            flash[:error] = "Address can not be blank."
            redirect_to trip_path(location_params[:trip_id])
        else 
            @location = Location.find_or_create_by(address: location_params[:address]) do |u|
                u.user_id = current_user.id
            end
            @trip = Trip.find_by(id: location_params[:trip_id])
            @trip.trip_locations.create(location_id: @location.id)
            redirect_to trip_path(@trip)
        end
    end

    private
    # STRONG PARAMS PERMISSIONS
    def location_params
        params.require(:location).permit(
        :address,
        :trip_id
        )
    end
end
