# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Testing remote
#


JoinOrderItem.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

#User

13.times do |index|
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = "kittenpics_#{index}@yopmail.com"
  u.password = '123456' #Faker::Internet.password
  puts "User #{index} created" if u.save
end

#Items

133.times do |index|
    u = Item.new
    u.name = Faker::Creature::Cat.name
    u.description = Faker::Lorem.paragraph(sentence_count: 15)
    u.price = rand(1..30)+0.99
    puts "Item #{index} created" if u.save
end

#Carts

26.times do |index|
  u = Cart.new
  u.user = User.all.sample
  u.item = Item.all.sample
  u.quantity = rand(1..5)
  puts "Cart #{index} created" if u.save
end

#Orders

12.times do |index|
  u = Order.new
  u.user = User.all.sample
  puts "Order #{index} created" if u.save
end

#Join items Order
45.times do |index|
  u = JoinOrderItem.new
  u.order = Order.all.sample
  u.item = Item.all.sample
  puts "JoinOrderItem #{index} created" if u.save
end
