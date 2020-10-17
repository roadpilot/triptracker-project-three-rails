class TripsController < ApplicationController

    def index
        @trips = current_user.trips
    end

    def new
        @trip = Trip.new
        @trip.locations.build(business_name: "blank")
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        @location = Location.new
        # binding.pry
        # @trip.trip_locations.build(trip_id: params[:id])
    end

    def create
        @location = Location.find_or_create_by(address: trip_params[:locations][:address]) do |u|
            u.user_id = current_user.id
        end
        @trip = current_user.trips.create(name: trip_params[:name])
        @trip.trip_locations.create(location_id: @location.id)
        redirect_to trip_path(@trip)
    end

    # def update
    #     # binding.pry
    #     # @location = Location.find_or_create_by(address: trip_params[:locations_attributes][:address])
    #     @location = Location.find_or_create_by(address: trip_params[:locations][:address]) do |u|
    #         u.user_id = current_user.id
    #     end
    #     @trip = current_user.trips.find_by(id: params[:id])
    #     @trip.trip_locations.create!(location_id: @location.id)
    #     redirect_to trip_path(@trip)
    # end

    def destroy
        trip = Trip.find_by(id: params[:id])
        trip.destroy
        redirect_to user_path(trip.user_id)
    end

    private
    def trip_params
        params.require(:trip).permit(
        :name,
        locations: [
            :address
        ]
        )
    end

end
