class Activity < ApplicationRecord
  
  CATEGORIES = ['Randonnée', 'Mer', 'Shopping']

  has_many :trips, through: :booking_activities
  has_many :booking_activities

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
