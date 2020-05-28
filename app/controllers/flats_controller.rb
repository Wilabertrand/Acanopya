class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@flats = policy_scope(Flat).order(created_at: :desc).geocoded
		@markers = @flats.map do |flat|
			{
        lat: flat.latitude,
        lng: flat.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })				
      }
		end
	end

	def show
	end

	private 

	def before_action
		@flat = Flat.find(params[:id])
		authorize_flat
	end 

end