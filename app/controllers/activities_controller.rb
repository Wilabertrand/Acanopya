class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @trip = Trip.find(params[:trip_id])
		activities = Activity.where("address ILIKE ?", "%#{@trip.location}%")
		@activities = policy_scope(activities).order(created_at: :desc) # à bien garder!!!
		if @activities.empty?
			flash[:alert] = "Tous vos critères ne sont pas remplis, mais consultez nos alternatives !"
			@activities = policy_scope(Activity).order(created_at: :desc) if @activities.empty? # à bien garder!!!
		end
  end

  def show
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
