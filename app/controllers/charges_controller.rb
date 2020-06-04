class ChargesController < ApplicationController
  def new
  end

  def create
    @carts = Cart.all.where(user:current_user)
    @amount = 0
    @carts.each do |cart|
      @amount += cart.item.price * cart.quantity
    end
    @amount = (@amount * 100).to_i
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    Cart.all.where(user:current_user).destroy_all

    flash[:success] = 'Paiement effecté'
    redirect_to user_path(current_user.id)
  end
end
