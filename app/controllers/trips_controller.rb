class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :edit, :destroy]

  def new
      @trip = current_user.trips.new
      authorize_trip
  end

  def index
      @trips = policy_scope(Trip).order(created_at: :desc)
  end


  def create
      @trip = current_user.trips.new(trip_params)
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
