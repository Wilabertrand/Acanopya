class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
		@flats =  if params[:filter]
			Flat.where(
			  address: params[:filter][:address],
			  capacity: params[:filter][:capacity]
			)
		else
			@flats = policy_scope(Flat).order(created_at: :desc)
		end
		redirect_to flats_path
	end

	def show
	end

	private 

	def before_action
		@flat = Flat.find(params[:id])
		authorize_flat
	end 

end