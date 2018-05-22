class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_many :rockets
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  def rockets_display
    str = ""
    if self.rockets?
      self.rockets.each do |rocket|
        str += "A model #{rocket.model} with #{rocket.capacity} sits."
      end
    else
      str = "You don't have a rocket yet."
    end
    return str
  end

  def rockets?
    self.rockets != nil
  end

end
