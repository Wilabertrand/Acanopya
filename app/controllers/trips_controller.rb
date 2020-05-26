class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :update]


    def new
    end

    def index
        @trips = Trip.all
        @trips = policy_scope(Trip).order(created_at: :desc)
      end

    def create
    #    authorize @trip
    #    @restaurant.user = current_user
        @trip = Trip.new(trip_params)
        @trip.save
    #       if policy(Restaurant).create?
    #           flash[:notice] = "Votre voyage a bien été créé"
                redirect_to flats_path
    #       else
    #           flash[:alert] = "Votre voyage ne s'est pas bien créé"
    #           render :new
    #       end
        end
    
    def show
    end

    def update
        authorize @trip
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