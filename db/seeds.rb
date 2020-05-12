# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

3.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, encrypted_password: '123456')
end

5.times do
  Event.create(user_id: User.all.sample.id, start_date: Date.today + rand(10_000), duration: rand(60..242), title: Faker::Superhero.descriptor, price: rand(1..1000), location: Faker::Movies::HarryPotter.location, description: Faker::GreekPhilosophers.quote)
end

2.times do
  Attendance.create(user_id: User.all.sample.id, event_id: Event.all.sample.id, stripe_customer_id: Faker::Bank.iban)
end
