class Rocket < ApplicationRecord
  require 'json'

  filepath = './db/swstarships.json'
  serialized_starships = File.read(filepath)
  starships = JSON.parse(serialized_starships)

  ROCKETS = {}

  starships["results"].each_with_index do |starship|
    ROCKETS[starship["model"]] = {capacity: starship["passengers"], model: starship["model"]}
  end

  belongs_to :user
  has_many :flights, dependent: :destroy
  validates :capacity, :model, :name, presence: true
  mount_uploader :photo, PhotoUploader

  def display_info
    if self.name
      str = "#{self.name}, a model #{self.model} with #{self.capacity} sits."
    else
      str = "An anonymous rocket, model #{self.model} with #{self.capacity} sits."
    end
    return str
  end

  def name_and_model_for_new
    ["#{name} - #{model}", id]
  end
end
