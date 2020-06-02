class Activity < ApplicationRecord
  has_many :trips, through: :booking_activities
  has_many :booking_activities
  has_many_attached :photos
  has_many :activity_reviews,  through: :booking_activities

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
