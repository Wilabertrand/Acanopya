class ActivityReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking_activity

  validates :rating,  numericality: { greater_than: 0, less_than_or_equal_to: 5 }, allow_blank: true

  def average_rating
    ratings = []
    ratings << rating
    sum = 0
    ratings.each do |rating|
      sum += rating
    end
    @average_rating = sum / ActivityReview.count
  end

end
