class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@flats = Flat.all
	end

	def show
	end

	private 

	def before_action
		@flat = Flat.find(params[:id])
	end 

end