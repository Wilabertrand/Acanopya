class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		@restaurants = policy_scope(Restaurant).order(created_at: :desc).geocoded
		@restaurants = Restaurant.near(@trip.location, 20)
		if @restaurants.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@restaurants = policy_scope(Restaurant).order(created_at: :desc)
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
    authorize(@restaurant)
    @restaurantreservation = BookingRestaurant.find_by(restaurant: @restaurant, trip: @trip)
    @restaurant_review = RestaurantReview.new
    @restaurant_reviews = @booking_restaurant.restaurant_reviews
    @average_rating = @restaurant_reviews.average(:rating)
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