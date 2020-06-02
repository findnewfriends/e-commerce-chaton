class Order < ApplicationRecord
  belongs_to :user
  has_many :join_order_items
  has_many :items, through: :join_order_items
end
