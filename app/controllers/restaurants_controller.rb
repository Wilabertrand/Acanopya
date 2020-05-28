class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @restaurants =  if params[:filter]
			Restaurant.where(
			  address: params[:filter][:address],
			)
		else
			@restaurants = policy_scope(Flat).order(created_at: :desc)
		end
		redirect_to restaurants_path
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize_restaurant
  end
end