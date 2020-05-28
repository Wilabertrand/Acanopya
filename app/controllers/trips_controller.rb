class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :edit, :destroy]

    def index
        @trips = policy_scope(Trip).order(created_at: :desc)
        @trip = current_user.trips.new(trip_params)
        authorize_trip
        if @trip.save
            flash[:notice] = "Votre voyage a bien été créé"
            redirect_to trip_flats_path(@trip.id)
        else
            flash[:alert] = "Votre voyage ne s'est pas bien créé"
            redirect_to(root_path)

        end
    end

    def show
        @trip = Trip.find(params[:id])
        @flats_bookings = BookingFlat.where(trip_id: @trip)
    end

    def create
        @trip = current_user.trips.new(trip_params)
        authorize_trip
        if @trip.save
            flash[:notice] = "Votre voyage a bien été créé"
            redirect_to trip_flats_path(@trip.id)
        else
            flash[:alert] = "Votre voyage ne s'est pas bien créé"
            redirect_to root_path
        end
    end

    def edit
    end

    def update
        @trip.update(trip_params)
        redirect_to trip_path(@trip)
    end

    def destroy
        @trip.destroy
        redirect_to trips_path
    end

    private

    def authorize_trip
        authorize(@trip)
    end

    def trip_params
        params.require(:trip).permit(:name, :location, :start_date, :end_date, :number_of_travellers)
    end

    def set_trip
        @trip = Trip.find(params[:id])
        authorize_trip
    end
end
