class Restaurant < ApplicationRecord
  has_many :trips, through: :booking_restaurants
  has_many :booking_restaurants

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end
