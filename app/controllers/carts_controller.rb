class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all.where(user:current_user)
    @prices = 0

    @carts.each do |cart|
      @prices += cart.item.price * cart.quantity
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params['id'])
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create

    unless user_signed_in?
      redirect_to items_path, notice: 'Please sign in to add items to the cart'
      return
    end
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_path, notice: 'Item added to cart successfully' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { redirect_to items_path, notice: 'Item could not be added to the cart' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    puts "---------------------------------------------o-o-o-o-o---o-o-o-o-o- params are #{ params}"
    puts "---------------------------------------------o-o-o-o-o---o-o-o-o-o- cart_params are #{ cart_params}"
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_url, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def cart_params
      cart_params = params.require(:cart).permit(:user, :item, :quantity)
      cart_params[:item] = Item.find(cart_params[:item].to_i)
      cart_params[:user] = User.find(cart_params[:user].to_i)
      return cart_params
    end



end
