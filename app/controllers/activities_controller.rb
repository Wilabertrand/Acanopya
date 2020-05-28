class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]
  
  def index
    @activities = policy_scope(Activity).order(created_at: :desc)
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
