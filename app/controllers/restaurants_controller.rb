class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  
  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize_restaurant
  end
end