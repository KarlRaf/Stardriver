class Flight < ApplicationRecord
  belongs_to :rocket
  has_many :bookings, dependent: :destroy;
  validates :date, :destination, :departure, presence: true

  def self.search(search)
    flight = Flight.find_by(destination: search)
  end
end
