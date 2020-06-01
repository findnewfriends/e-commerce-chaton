class Item < ApplicationRecord
    has_many :JoinOrderItem
    has_many :orders, through: :JoinOrderItem
end
