class Trip < ApplicationRecord
  belongs_to :user
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_travellers, presence: true
  validates :location, presence: true
end
