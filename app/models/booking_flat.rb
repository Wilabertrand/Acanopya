class BookingFlat < ApplicationRecord
  belongs_to :flat
  belongs_to :trip

  # validates :status, presence: true
end
