class Flat < ApplicationRecord
  has_many :trips, through: :booking_flats
end
