class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @activities = policy_scope(Activity).order(created_at: :desc)
    authorize_activity
  end

  def show
  end

  private

  def set_restaurant
    @activity = Activity.find(params[:id])
    authorize_activity
  end
end
