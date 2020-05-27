class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :update]


    def create
        @trip = Trip.new(trip_params)
        @trip.user = current_user
        if @trip.save
            redirect_to flats_path
        else
            render 'pages/home'
        end
    end
    
    def show
        @trip = Trip.find(params[:id])
        @flats_bookings = BookingFlat.where(trip_id: @trip)
    end

    def update
        @trip.update(params[:trip])
    end

    private

    def trip_params
        params.require(:trip).permit(:name, :address, :start_date, :end_date, :number_of_travellers)
    end

    def set_trip
        @trip = Trip.find(params[:id])
    end
end