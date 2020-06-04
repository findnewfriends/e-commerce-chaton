class Order < ApplicationRecord
  belongs_to :user
  has_many :join_order_items
  has_many :items, through: :join_order_items

  after_create :order_confirmation

  def order_confirmation
    UserMailer.order_confirmation(self, self).deliver_now
  end
end
