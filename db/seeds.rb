# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear the database to avoid duplication errors
puts "Clearing the database"
User.destroy_all
Clothing.destroy_all
Rental.destroy_all

# Users
puts "Creating users"
user1 = User.create!(email: "user1@thrift.com", password: "password")
user2 = User.create!(email: "user2@thrift.com", password: "password")
puts "#{User.count} users created"

# Clothings
clothing1 = Clothing.create!(
  title: "Vintage Denim Jacket",
  description: "A cool, vintage denim jacket from the 90s.",
  price: 50.0,
  size: "M",
  user_id: user1.id
)

clothing2 = Clothing.create!(
  title: "Retro Floral Dress",
  description: "Beautiful retro dress with floral pattern. Perfect for any vintage lover!",
  price: 35.0,
  size: "S",
  user_id: user2.id
)

# Rentals
Rental.create!(
  status: "available",
  price: 10.0,
  clothing_id: clothing1.id,
  user_id: user2.id
)

Rental.create!(
  status: "rented",
  price: 8.0,
  clothing_id: clothing2.id,
  user_id: user1.id
)

puts "Seeded database with #{User.count} users, #{Clothing.count} clothings, and #{Rental.count} rentals."
