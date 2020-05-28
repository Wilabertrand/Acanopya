class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc).geocoded
		@markers = @restaurants.map do |restaurant|
			{
        lat: restaurant.latitude,
        lng: restaurant.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })				
      }
		end
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize_restaurant
  end
end