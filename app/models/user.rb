class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :carts
  ROLES = %i[buyer admin banned]


  before_save :default_values
  def default_values
    self.role ||= "buyer" # i.e. self.role = 'buyer' if self.role.nil?
  end

  after_create :welcome_send
  def welcome_send
    puts "Welcome email is going to be requested next"
    UserMailer.welcome_email(self).deliver_now
  end

  def admin?
    self.role == "admin"
  end

end
