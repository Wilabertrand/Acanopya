class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		@activities = policy_scope(Activity).order(created_at: :desc).geocoded
		@activities = Activity.near(@trip.location, 20)
		if @activities.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@activities = policy_scope(Activity).order(created_at: :desc)
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
    authorize(@activity)
    @activityreservation = BookingActivity.find_by(activity: @activity, trip: @trip)
    @activity_review = ActivityReview.new
    authorize(@activity_review)
    @activity_reviews = @booking_activity.activity_reviews
    @average_rating = @activity_reviews.average(:rating)
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
