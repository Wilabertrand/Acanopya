class FlatsController < ApplicationController
	before_action :set_flat, only: [:show]

	def index
	# if params[:query].present?
    #   @flats = Flat.where("address ILIKE ?", "%#{params[:query]}%") && || Flat.where(capacity: >= params[:query]) && || Flat.where(price: <= params[:query])
	# else
		@flats = policy_scope(Flat).order(created_at: :desc)
    # end
		redirect_to flats_path
	end

	def show
	end

	private 

	def before_action
		@flat = Flat.find(params[:id])
		authorize_flat
	end 

	def authorize_flat
		authorize(@flat)
	end

end