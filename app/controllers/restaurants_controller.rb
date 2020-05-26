class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @restaurant = Restaurant.all
  end

  def show
  end
end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end