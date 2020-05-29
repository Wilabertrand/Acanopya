class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@trip = Trip.find(params[:trip_id])
		@flats = policy_scope(Flat).order(created_at: :desc).geocoded
		@flats = Flat.near(@trip.location, 20).where("capacity >= ?", "#{@trip.number_of_travellers}")
		if @flats.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@flats = policy_scope(Flat).order(created_at: :desc)
		end
		@markers = @flats.map do |flat|
			{
        lat: flat.latitude,
        lng: flat.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })				
			}
		end
	end

	def show
		@booking_flat = BookingFlat.new
		@trip = Trip.find(params[:trip_id])
	end

	private 

	def set_flat
		@flat = Flat.find(params[:id])
		authorize_flat
	end 

	def authorize_flat
		authorize(@flat)
	end


end