class Rocket < ApplicationRecord
  belongs_to :user
  has_many :flights, dependent: :destroy
  validates :capacity, :model, presence: true

end
