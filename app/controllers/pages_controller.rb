class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact ]

  def home
    @trip = Trip.new
  end

  def index
    @flats =  Flat.where(
      location: params[:filter][:location],
      capacity: params[:filter][:capacity]
    )
    ​
    @restaurants =  if params[:filter]
      Hotel.where(
        location: params[:filter][:location],
                  end
    ​
    @activities =  if params[:filter]
      Hotel.where(
        location: params[:filter][:location],
        toto: params[:filter][:toto]
        # capacity: params[:filter][:capacity]
        )
      else
        []
      end
  end

  def about
  end

  def contact
  end

end
