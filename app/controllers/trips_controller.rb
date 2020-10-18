class TripsController < ApplicationController
  before_action :require_logged_in

    def index
        @trips = current_user.trips
    end

    def new
        # raise params.inspect
        # binding.pry
        if params[:user_id].to_i == current_user.id
            @trip = Trip.new
            @trip.locations.build(business_name: "blank")
        else
            flash[:error] = "User not authorized to other user resources."
            redirect_to "/"
        end
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        @location = Location.new
        if current_user.id != @trip.user_id
            flash[:error] = "User not authorized to other user resources."
            redirect_to "/"
        end        
    end

    def create
        if trip_params[:locations][:address].strip == ""
            flash[:error] = "Address can not be blank."
            # @trip = Trip.new
            # @trip.locations.build(business_name: "blank")
            # # render :new
            redirect_to "#{user_path(current_user)}#{new_trip_path}"
        else
            @location = Location.find_or_create_by(address: trip_params[:locations][:address]) do |u|
                u.user_id = current_user.id
            end
            # binding.pry
            @trip = current_user.trips.create(name: trip_params[:name])
            @trip.trip_locations.create(location_id: @location.id)
            redirect_to trip_path(@trip)
        end
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
