class BookingRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :trip
end
