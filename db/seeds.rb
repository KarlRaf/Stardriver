# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Flight.destroy_all
Rocket.destroy_all
User.destroy_all
require 'faker'

10.times do
  user = User.create!(name: Faker::StarWars.character, email: Faker::Internet.email, bio: Faker::BackToTheFuture.quote, password: "secret")
  rocket = Rocket.new(capacity: Rocket::ROCKETS[ Rocket::ROCKETS.keys.sample][:capacity], model: Rocket::ROCKETS[ Rocket::ROCKETS.keys.sample][:model], name: Faker::Space.nasa_space_craft, photo: 'images/xwing.png' )
  rocket.user = user
  rocket.save!
  5.times do
    flight = Flight.create!(date: Faker::BackToTheFuture.date, destination: Faker::StarWars.planet, departure: Faker::StarTrek.location, description: Faker::StarWars.quote, rocket: rocket)
  end
end
puts "Seeded!"
