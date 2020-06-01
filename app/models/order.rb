class Order < ApplicationRecord
  belongs_to :user
  has_many :JoinOrderItem
  has_many :items, through: :JoinOrderItem
end
