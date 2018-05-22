class Rocket < ApplicationRecord
  belongs_to :user
  has_many :flights, dependent: :destroy
  validates :capacity, :model, presence: true

  def diplay
    str = "A model #{self.model} with #{self.capacity} sits."
    return str
  end

end
