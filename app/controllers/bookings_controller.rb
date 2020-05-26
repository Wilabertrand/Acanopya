class PagesController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update]
  
    def index
        @booking = Booking.all.where(user_id)
    end

    def new
        @booking = Booking.new
    end
  
    def create
        @booking = Booking.create
        @booking.save
        redirect_to trips_path
    end
  
    def show
    end

    def update
    end
  
    def edit
    end

    def destroy
    end

    private
 / booking params = pour créer ou éditer une résa, il faut que les params soient liés aux id
 des restau-act-flats, d'où cette tentative /
    def bookings_params
        params.require(:restaurant_id)
        params.require(:activities_id)
        params.require(:flats_id)
    end

    def set_booking
        @booking = booking.find(params[:id])
    end

  end
  