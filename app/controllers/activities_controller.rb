class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @activities = policy_scope(Activity).order(created_at: :desc).geocoded
		@markers = @activities.map do |activity|
			{
        lat: activity.latitude,
        lng: activity.longitude,
				infoWindow: render_to_string(partial: "info_window", locals: { activity: activity })				
      }
    end
  end

  def show
  end

  private

  def set_restaurant
    @activity = Activity.find(params[:id])
    authorize_activity
  end
end
