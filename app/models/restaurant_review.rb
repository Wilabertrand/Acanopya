class RestaurantReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking_restaurant
end
