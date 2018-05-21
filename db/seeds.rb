# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flight.destroy_all
Rocket.destroy_all
User.destroy_all
require 'faker'

10.times do
  user = User.create!(name: Faker::StarWars.character, email: Faker::Internet.email, bio: Faker::BackToTheFuture.quote, password: "secret")
  rocket = Rocket.new(capacity: rand(*[1..25]), model: Faker::StarWars.vehicle)
  rocket.user = user
  rocket.save!
  flight = Flight.create!(date: Faker::BackToTheFuture.date, destination: Faker::StarWars.planet, departure: Faker::StarTrek.location, description: Faker::StarWars.quote, rocket: rocket)
end
