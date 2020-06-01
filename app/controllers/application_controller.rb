class ApplicationController < ActionController::Base
    before_action :set_cart
 
  private
 
  def set_cart
    @cart = Cart.create(user_id:current_user[:id])

  end
end
