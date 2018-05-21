class Rocket < ApplicationRecord
  belongs_to :user
  has_many :flights
  validates :capacity, :model, presence: true
end
