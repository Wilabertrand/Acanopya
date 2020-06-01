class ActivityReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking_activity

end
