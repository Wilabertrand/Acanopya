class Flat < ApplicationRecord
  has_many :trips, through: :booking_flats

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :capicity, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end
