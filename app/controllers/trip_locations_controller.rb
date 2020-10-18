class TripLocationsController < ApplicationController
  before_action :require_logged_in

    # UPDATE RECORD FROM JOIN TABLE
    def update
        tl = TripLocation.find_by(id: params[:id])
        tl.update(tl_params)
        redirect_to trip_path(tl.trip_id)
    end

    # DELETE RECORD FROM JOIN TABLE
    def destroy
        tl = TripLocation.find_by(id: params[:id])
        tl.destroy
        redirect_to trip_path(tl.trip_id)
    end

    private
    # STRONG PARAMS PERMISSIONS
    def tl_params
        params.require(:trip_location).permit(:time_in, :time_out)
    end

end
