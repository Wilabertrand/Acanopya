class FlatsBookingsController < ApplicationController
  
    def create
		@flat = Flat.find(params[:flat_id])
		@booking_flat = BookingFlat.new(booking_params)
		@booking_flat.flat = @flat
        @booking_flat.user = current_user
        raise
        authorize_booking_flats
		if @booking_flat.save
			flash[:success] = "Votre logement est maintenant réservé"
			redirect_to trips_path
		else
			flash[:error] = "Quelque chose ne s'est pas passé comme prévu"
			render @flat
		end
	end

    private

    def booking_params
        params.require(:booking_flat).permit(:start_date, :end_date)
    end

    def authorize_booking_flats
        authorize(@booking_flat)
    end

  end
  