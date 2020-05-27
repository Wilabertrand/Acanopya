class Restaurant < ApplicationRecord
  has_many :trips, through: :booking_restaurants
  has_many :booking_restaurants, dependent: :destroy
end
