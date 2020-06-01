class BookingFlat < ApplicationRecord
  belongs_to :flat
  belongs_to :trip
  has_many :flat_reviews, dependent: :destroy

  # validates :status, presence: true
end
