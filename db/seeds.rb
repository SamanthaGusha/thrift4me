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
Rental.destroy_all
Clothing.all.each { |cloth| cloth.photo.purge }
Clothing.destroy_all
User.destroy_all

# Users
puts "Creating users"
user1 = User.create!(email: "user1@thrift.com", password: "password")
user2 = User.create!(email: "user2@thrift.com", password: "password")
user3 = User.create!(email: "user3@thrift.com", password: "password")
user4 = User.create!(email: "user4@thrift.com", password: "password")
user5 = User.create!(email: "finn@thrift.com", password: "password")
puts "#{User.count} users created"

# Clothings
image_1 = URI.open("https://cdn-img.prettylittlething.com/3/c/9/5/3c95a37cdb5a5906a098c4b30d7f8ec162af7896_cmh4320_1.jpg")
clothing1 = Clothing.create!(
  title: "Vintage Denim Jacket",
  description: "A cool, vintage denim jacket from the 90s.",
  price: 50.0,
  size: "M",
  user_id: user1.id
)
clothing1.photo.attach(io: image_1, filename: 'nes.png', content_type: "image/png")
clothing1.save

image_2 = URI.open("https://jamclothing.co.za/wp-content/uploads/2024/02/H7A2078.jpg")
clothing2 = Clothing.create!(
  title: "Retro Floral Dress",
  description: "Beautiful retro dress with floral pattern. Perfect for any vintage lover!",
  price: 35.0,
  size: "S",
  user_id: user2.id
)
clothing2.photo.attach(io: image_2, filename: 'nes.png', content_type: "image/png")
clothing2.save

image_3 = URI.open("https://cdn.zando.co.za/p/429239-3929-932924-2-zoom.jpg")
clothing3 = Clothing.create!(
  title: "Leather Biker Jacket",
  description: "Classic leather biker jacket for a rugged look.",
  price: 80.0,
  size: "L",
  user_id: user3.id
)

clothing3.photo.attach(io: image_3, filename: 'nes.png', content_type: "image/png")
clothing3.save

image_4 = URI.open("https://cdn.media.amplience.net/i/mrpricegroup/01_102816954_SI_00?$preset.jpg")
clothing4 = Clothing.create!(
  title: "Striped T-shirt",
  description: "Casual striped t-shirt for everyday wear.",
  price: 20.0,
  size: "XL",
  user_id: user4.id
)

clothing4.photo.attach(io: image_4, filename: 'nes.png', content_type: "image/png")
clothing4.save

image_5 = URI.open("https://thefoschini.vtexassets.com/arquivos/ids/108948787-1200-1200?v=638425827191100000&width=1200&height=1200&aspect=true.jpg")
clothing5 = Clothing.create!(
  title: "Boyfriend Jeans",
  description: "Perfectly baggy denim jeans",
  price: 60.0,
  size: "M",
  user_id: user5.id
)

clothing5.photo.attach(io: image_5, filename: 'nes.png', content_type: "image/png")
clothing5.save

# Rentals
Rental.create!(
  status: "available",
  clothing_id: clothing1.id,
  user_id: user1.id
)

Rental.create!(
  status: "rented",
  clothing_id: clothing2.id,
  user_id: user2.id
)

Rental.create!(
  status: "available",
  clothing_id: clothing2.id,
  user_id: user3.id
)

Rental.create!(
  status: "rented",
  clothing_id: clothing2.id,
  user_id: user4.id
)

Rental.create!(
  status: "available",
  clothing_id: clothing2.id,
  user_id: user5.id
)

puts "Seeded database with #{User.count} users, #{Clothing.count} clothings, and #{Rental.count} rentals."
