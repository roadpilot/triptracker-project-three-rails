class TripsController < ApplicationController
  before_action :require_logged_in

    # INDEX PAGE OF ALL TRIPS BY USER, DEMO ONLY
    def index
        @trips = current_user.trips
    end

    # NEW TRIP
    def new
        if params[:user_id].to_i == current_user.id
            @trip = Trip.new
            @trip.locations.build(business_name: "blank")
        else
            if params[:user_id]
                flash[:error] = "User not authorized to other user resources."
                redirect_to "/"
            else
                redirect_to "/users/#{current_user.id}/trips/new"
            end
        end
    end

    # SHOW ALL TRIPS FOR LOGGED IN USER
    def show
        @trip = Trip.find_by(id: params[:id])
        @location = Location.new
        if current_user.id != @trip.user_id
            flash[:error] = "User not authorized to other user resources."
            redirect_to "/"
        end        
    end

    # CREATE NEW TRIP FROM FORM AND ASSOCIATE A NEW LOCATION
    def create
        if trip_params[:locations][:address].strip == ""
            flash[:error] = "Address can not be blank."
            redirect_to "#{user_path(current_user)}#{new_trip_path}"
        else
            @location = Location.find_or_create_by(address: trip_params[:locations][:address]) do |u|
                u.user_id = current_user.id
            end
            @trip = current_user.trips.create(name: trip_params[:name])
            @trip.trip_locations.create(location_id: @location.id)
            redirect_to trip_path(@trip)
        end
    end

    # NOT APPLICABLE
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

    # DELETE EXISTING TRIP AND SEND BACK TO USERS SHOWW
    def destroy
        trip = Trip.find_by(id: params[:id])
        trip.destroy
        redirect_to user_path(trip.user_id)
    end

    private
    # STRONG PARAMS PERMISSIONS
    def trip_params
        params.require(:trip).permit(
            :name,
            locations: [
                :address
            ]
        )
    end

end
