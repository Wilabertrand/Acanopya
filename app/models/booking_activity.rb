class BookingActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :trip
end
