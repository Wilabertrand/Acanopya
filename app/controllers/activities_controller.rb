class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
    @activities = policy_scope(Activity).order(created_at: :desc)
  end

  def show
    @booking_activity = BookingActivity.new
		@trip = Trip.find(params[:trip_id])
  end

  
  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize_activity
  end

  def authorize_activity
    authorize(@activity)
  end

end
