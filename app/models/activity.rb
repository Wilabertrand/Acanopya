class Activity < ApplicationRecord
  has_many :trips, through: :booking_activities
  has_many :booking_activities
end
