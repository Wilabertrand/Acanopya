class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@trip = Trip.find(params[:trip_id])
		flats = Flat.where("address ILIKE ?", "%#{@trip.location}%").where("capacity >= ?", "#{@trip.number_of_travellers}")
		@flats = policy_scope(flats).order(created_at: :desc).geocoded
		if @flats.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@flats = policy_scope(Flat).order(created_at: :desc) if @flats.empty?
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