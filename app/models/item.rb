class Item < ApplicationRecord
  has_one_attached :photo

  has_many :carts
  has_many :join_order_items
  has_many :order, through: :join_order_items

  validates :price, presence: true, :numericality => {
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 1000}

  end
