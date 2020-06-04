<<<<<<< HEAD
# Destroy all tables and restart the id at 1

JoinOrderItem.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE join_order_items_id_seq RESTART WITH 1")

Cart.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE carts_id_seq RESTART WITH 1")

Item.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE items_id_seq RESTART WITH 1")

Order.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE orders_id_seq RESTART WITH 1")


User.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1")
=======
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
>>>>>>> master

#User

13.times do |index|
  u = User.new
<<<<<<< HEAD
  u.role = "admin" if index == 0
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = "kittenpics_#{index}@yopmail.com"
  u.email = "kittenpics_admin@yopmail.com" if index == 0
  u.password = '123123' #Faker::Internet.password
=======
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = "kittenpics_#{index}@yopmail.com"
  u.password = '123456' #Faker::Internet.password
>>>>>>> master
  puts "User #{index} created" if u.save
end

#Items

<<<<<<< HEAD

chat = []
chat[0] = 'http://somestuff.online/imgs-kittens/kitten_001.jpg'
chat[1] = 'http://somestuff.online/imgs-kittens/kitten_002.jpg'
chat[2] = 'http://somestuff.online/imgs-kittens/kitten_003.jpg'
chat[3] = 'http://somestuff.online/imgs-kittens/kitten_004.jpg'
chat[4] = 'http://somestuff.online/imgs-kittens/kitten_005.jpg'
chat[5] = 'http://somestuff.online/imgs-kittens/kitten_006.jpg'
chat[6] = 'http://somestuff.online/imgs-kittens/kitten_007.jpg'
chat[7] = 'http://somestuff.online/imgs-kittens/kitten_008.jpg'
chat[8] = 'http://somestuff.online/imgs-kittens/kitten_009.jpg'
chat[9] = 'http://somestuff.online/imgs-kittens/kitten_010.jpg'
10.times do |index|
=======
133.times do |index|
>>>>>>> master
    u = Item.new
    u.name = Faker::Creature::Cat.name
    u.description = Faker::Lorem.paragraph(sentence_count: 15)
    u.price = rand(1..30)+0.99
<<<<<<< HEAD
    u.url = chat[index]
    #u.photo.attach(io: File.open("app/assets/images/kitten_#{index + 1}.jpg"), filename: "kitten #{index}",content_type: 'image/jpg')
=======
>>>>>>> master
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
