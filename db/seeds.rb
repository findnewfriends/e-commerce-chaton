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

#User
number_users = 5
number_users.times do
    User.create(first_name:Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password:Faker::Internet.password)
end

#Items
number_items = 5
number_items.times do
    Item.create(name: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph(sentence_count: 15), price: rand(1..30))
end

#Carts
number_carts = 5
number_carts.times do
    Cart.create(user_id: rand(1..number_users), item_id: rand(1..number_items), quantity: rand(1..5) )
end

#Orders
number_orders = 5
number_orders.times do
    Order.create(user_id: rand(1..number_users))
end

#Join items Order
(number_orders * 2).times do
    JoinOrderItem.create(item: Item.find(rand(1..number_items)), order: Order.find(rand(1..number_orders)))
end