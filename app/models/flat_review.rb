class FlatReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking_flat

  validates :rating,  numericality: { greater_than: 0, less_than_or_equal_to: 5 }, allow_blank: true



end
