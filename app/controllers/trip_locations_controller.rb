class TripLocationsController < ApplicationController
    def update
        # binding.pry
        tl = TripLocation.find_by(id: params[:id])
        tl.update(tl_params)
        redirect_to trip_path(tl.trip_id)
    end

    def destroy
        tl = TripLocation.find_by(id: params[:id])
        tl.destroy
        redirect_to trip_path(tl.trip_id)
    end

    def tl_params
        params.require(:trip_location).permit(:time_in, :time_out)
    end

end
