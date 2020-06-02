class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		@activities = Activity.near(@trip.location, 20)
	
      if params[:search]&.fetch(:price_max).present?
        @price_max = params[:search][:price_max]
        @activities = @activities.where("price <= ?", @price_max)
      end

    @markers = @activities.map do |activity|
			{
        lat: activity.latitude,
        lng: activity.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { activity: activity })				
      }
    end
  end


  def show
    @booking_activity = BookingActivity.new
    @trip = Trip.find(params[:trip_id])
    @markers = [{ lat: @activity.latitude, lng: @activity.longitude }]
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
