class Flight < ApplicationRecord
  belongs_to :rocket
  has_many :bookings
  validates :date, :destination, :departure, presence: true
end
