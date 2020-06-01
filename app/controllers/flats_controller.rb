class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@trip = Trip.find(params[:trip_id])
		@search = params["search"]
		if @search.present?
			@price = @search["price"]
			@capacity = @search["capacity"]
			@flats = policy_scope(Flat).where(price: @price, capacity: @capacity).geocoded
			if @flats.empty?
				flash[:alert] = "Aucun logement ne correspond à votre recherche."
				@flats = policy_scope(Flat).order(created_at: :desc)
			end
			else
				@flats = policy_scope(Flat).order(created_at: :desc).geocoded
				@flats = Flat.near(@trip.location, 20).where("capacity >= ?", "#{@trip.number_of_travellers}")
			if @flats.empty?
				flash[:alert] = "Tous les critères de recherches ne sont pas remplis."
				@flats = policy_scope(Flat).order(created_at: :desc)
			end
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
		@markers = [{ lat: @flat.latitude, lng: @flat.longitude }]
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