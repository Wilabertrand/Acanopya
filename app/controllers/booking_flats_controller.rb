class BookingFlatsController < ApplicationController
  
    /def index
        @flats_bookings = curent_user.
    end >>>>> pas d'index ici, ça se passe dans le trip/ 

    def new
        @booking = BookingFlat.new
    end

    def create
		@flat = Flat.find(params[:flat_id])
		@booking = BookingFlat.new(booking_params)
		@booking.flat = @flat
		@booking.user = current_user
		if @booking.save
			flash[:success] = "Votre logement est maintenant réservé"
			redirect_to trips_path
		else
			flash[:error] = "Quelque chose ne s'est pas passé comme prévu"
			render @flat
		end
	end
  
    def show
        @booking = booking.find(params[:id])
    end

    /def update
    end
  
    def edit
        
    end

    def destroy
		@flat = Flat.find(params[:flat_id])
		@booking.flat = @flat
    	@booking.destroy
    	redirect_to trips_path
	end >>>>> Méthodes inutiles si on ne fait que le happy path /

    private

    def booking_params
        params.require(:booking).permit(:flat, :user, :start_date, :end_date)
    end
  end
  