class Restaurant < ApplicationRecord

  CATEGORIES = ['Poissons', 'Monde', 'Italien', 'Japonais', 'Cuisine française']

  has_many :trips, through: :booking_restaurants
  has_many :booking_restaurants

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
