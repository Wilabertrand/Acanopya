class Flat < ApplicationRecord
  has_many :trips, through: :booking_flats
  has_many :booking_flats
end
