# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Vacation.destroy_all

20.times do
  Vacation.create(
    employee_full_name: Faker::Name.name,
    start_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now)
  )
end

puts "Seeds loaded successfully!"
