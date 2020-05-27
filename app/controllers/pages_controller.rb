class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
    @trip = Trip.new
    authorize_trip
  end

  def about
  end

  def contact
  end

end
