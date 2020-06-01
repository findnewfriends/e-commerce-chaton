class Item < ApplicationRecord
    has_many :JoinOrderItem
    has_many :orders, through: :JoinOrderItem
    has_one_attached :photo
end
