class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  skip_after_action :verify_policy_scoped, only: :index
  
  def index
    @trip = Trip.find(params[:trip_id])
    if params[:search]&.fetch(:price_max).present?
      @price_max = params[:search][:price_max]
      # @category = params[:search]["category"]
      @restaurants = Restaurant.near(@trip.location, 20)#.where("category >= ?", "#{@trip.number_of_travellers}")
      @restaurants = @restaurants.where("price <= ?", @price_max).geocoded
      # if @restaurants.empty?
      #   flash[:alert] = "Tous les critères de recherches ne sont pas remplis."
      #   @restaurants = policy_scope(Restaurant).order(created_at: :desc)
      # end
    else
      @restaurants = Restaurant.near(@trip.location, 20)
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
