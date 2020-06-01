class ActivityReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking_activity

  has_many :activity_reviews, dependent: :destroy

end
