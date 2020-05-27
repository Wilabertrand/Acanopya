class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
    @trip = current_user.trips.new
    authorize(@trip)
  end

  def about
  end

  def contact
  end

end
