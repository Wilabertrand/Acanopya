class Restaurant < ApplicationRecord
  has_many :trips, through: :booking_restaurants
end
