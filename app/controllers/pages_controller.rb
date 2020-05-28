class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
    @trip = Trip.new
  end

  def index
    if params[:query].present?
      @flats = Flat.where("address ILIKE ?", "%#{params[:query]}%") # && Flat.where(capacity: params[:query])
    else
      @flats = policy_scope(Flat).order(created_at: :desc)
    end

    #  @flats =  if params[:filter]
    #             Flat.where(
    #             address: params[:filter][:address],
    #             capacity: params[:filter][:capacity]
    #             )
    #           else
    #             @flats = policy_scope(Flat).order(created_at: :desc)
    #           end

  #   @restaurants = if params[:query]
  #                   Restaurant.where(
  #                     address: params[:query][:address],
  #                     )
  #                   else
  #                     @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  #                   end
  # ​
  #   @activities = if params[:query]
  #                   Activity.where(
  #                   address: params[:query][:address],
  #                   )
  #                 else
  #                   @activities = policy_scope(Activity).order(created_at: :desc)
  #                 end
  
   # redirect_to flats_path
  end

  def about
  end

  def contact
  end

end
