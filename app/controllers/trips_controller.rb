class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :update, :edit, :destroy]

    def new
        # @trip = current_user.trips.new
        @trip = Trip.new
        authorize_trip
    end

    def index
        @trips = policy_scope(Trip).order(created_at: :desc)
      end

    def create
        # @trip = current_user.trips.new(trip_params)
        @trip = Trip.new(trip_params)
        @trip.user = current_user
        authorize_trip
#       if policy(Trip).create?
        if @trip.save
            flash[:notice] = "Votre voyage a bien été créé"
            redirect_to flats_path
        else
            flash[:alert] = "Votre voyage ne s'est pas bien créé"
            render :new
        end
    end
    
    def show
        authorize_trip
    end

    def edit
        authorize_trip
    end

    def update
        authorize_trip
        @trip.update(trip_params)
    end

    def destroy
        authorize_trip
        @trip.destroy
    end

    private

    def authorize_trip
        authorize(@trip)
    end

    def trip_params
        params.require(:trip).permit(:name, :address, :start_date, :end_date, :number_of_travellers)
    end

    def set_trip
        @trip = Trip.find(params[:id])
    end
end
