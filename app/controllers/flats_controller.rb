class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@trip = Trip.find(params[:trip_id])
		@search = params["search"]
		if @search.present?
			@price_min = @search["price_min"]
			@price_max = @search["price_max"]
			@capacity = @search["capacity"]
			@flats = policy_scope(Flat).where("price > ? AND price < ?", @price_min, @price_max).geocoded
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
		@flat = Flat.find(params[:id])
		@trip = Trip.find(params[:trip_id])
		@markers = [{ lat: @flat.latitude, lng: @flat.longitude }]
		@duration = @trip.end_date - @trip.start_date
		@price = @flat.price * @duration
		authorize(@flat)
		@flatreservation = BookingFlat.find_by(flat: @flat, trip: @trip)
		@flat_review = FlatReview.new
		@flat_reviews = @flat.flat_reviews
		@average_rating = @flat_reviews.average(:rating)
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