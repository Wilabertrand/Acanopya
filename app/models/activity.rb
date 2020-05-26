class Activity < ApplicationRecord
  has_many :trips, through: :booking_activities
end
