class Order < ApplicationRecord
  belongs_to :user
  has_many :join_order_items
  has_many :items, through: :join_order_items

  after_create :order_confirmation

  def order_confirmation
    puts "Welcome email is going to be requested next"
    UserMailer.order_confirmation(self).deliver_now
  end
end
