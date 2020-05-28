class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		restaurants = Restaurant.where("address ILIKE ?", "%#{@trip.location}%")
		@restaurants = policy_scope(restaurants).order(created_at: :desc).geocoded
		if @restaurants.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@restaurants = policy_scope(Restaurant).order(created_at: :desc) if @restaurants.empty?
    end
    @markers = @restaurants.map do |restaurant|
			{
        lat: restaurant.latitude,
        lng: restaurant.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })				
      }
    end
  end

  def show
    @booking_restaurant = BookingRestaurant.new
    @trip = Trip.find(params[:trip_id])
    @markers = [{ lat: @restaurant.latitude, lng: @restaurant.longitude }]
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize_restaurant
  end

  def authorize_restaurant
		authorize(@restaurant)
	end

end