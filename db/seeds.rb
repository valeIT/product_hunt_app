# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all
Comment.destroy_all

user1 = User.new(username: "Finn The Human", password: "password")
user1.headline = "niiiiice"
user1.image_url = "https://res.cloudinary.com/dekgrddbo/image/upload/v1506267278/finn_the_human_bokynk.jpg"

user2 = User.new(username: "Jake The Dog", password: "password")
user2.headline = "wut."
user2.image_url = "https://res.cloudinary.com/dekgrddbo/image/upload/v1506306926/adventure-time-tshirt-jake-the-dog-face_s6ux9r.jpg"

user1.save
user2.save

product1 = Product.new(name: "Grass Sword")
product1.tagline = "It's grass!"
product1.link_url = Faker::Internet.url
product1.thumbnail_url = Faker::LoremPixel.image()
product1.user = user1
product1.save


comment1 = Comment.new(body: "Awesome")
comment1.user = user2
comment1.product = product1

comment2 = Comment.new(body: "totally")
comment2.user = user1
comment2.product = product1
comment2.parent_comment = comment1
comment2.save

comment3 = Comment.new(body: "Sweet!")
comment3.user = user2
comment3.product = product1
comment3.parent_comment = comment1
comment3.save



10.times do |i|
  p = Product.new
  p.name = Faker::Space.star_cluster
  p.tagline = Faker::HitchhikersGuideToTheGalaxy.marvin_quote
  p.thumbnail_url = Faker::LoremPixel.image()
  p.link_url = Faker::Internet.url
  p.user = [user1, user2].sample
  if p.valid?
    p.save
  end
end


# user1 = User.create(username: 'khai', password: 'password')
# room1 = Room.create(room_name: 'cool room')
# user1.rooms << room1