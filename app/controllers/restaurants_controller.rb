class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  skip_after_action :verify_policy_scoped, only: :index
  
  def index
    @trip = Trip.find(params[:trip_id])
    @restaurants = Restaurant.near(@trip.location, 20)

    if params[:search]&.fetch(:price_max).present?
      @price_max = params[:search][:price_max]
      @restaurants = @restaurants.where("price <= ?", @price_max)
    end

    if params[:search]&.fetch(:category).present?
      @category = params[:search][:category]
      @restaurants = @restaurants.where("category = ?", @category)
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
