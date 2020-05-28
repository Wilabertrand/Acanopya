class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@flats = policy_scope(Flat).order(created_at: :desc)
		@trip = Trip.find(params[:trip_id])
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