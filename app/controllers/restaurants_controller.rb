class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def show
    @booking_restaurant = BookingRestaurant.new
		@trip = Trip.find(params[:trip_id])
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