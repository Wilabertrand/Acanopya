class BookingRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :trip

  validates :status, presence: true
end
