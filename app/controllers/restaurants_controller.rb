class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		restaurants = Restaurant.where("address ILIKE ?", "%#{@trip.location}%")
		@restaurants = policy_scope(restaurants).order(created_at: :desc) # à bien garder!!!
		if @restaurants.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@restaurants = policy_scope(Restaurant).order(created_at: :desc) if @restaurants.empty? # à bien garder!!!
		end
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