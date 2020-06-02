class JoinOrderItemsController < ApplicationController
  before_action :set_join_order_item, only: [:show, :edit, :update, :destroy]

  # GET /join_order_items
  # GET /join_order_items.json
  def index
    @join_order_items = JoinOrderItem.all
  end

  # GET /join_order_items/1
  # GET /join_order_items/1.json
  def show
  end

  # GET /join_order_items/new
  def new
    @join_order_item = JoinOrderItem.new
  end

  # GET /join_order_items/1/edit
  def edit
  end

  # POST /join_order_items
  # POST /join_order_items.json
  def create
    @join_order_item = JoinOrderItem.new(join_order_item_params)

    respond_to do |format|
      if @join_order_item.save
        format.html { redirect_to @join_order_item, notice: 'Join order item was successfully created.' }
        format.json { render :show, status: :created, location: @join_order_item }
      else
        format.html { render :new }
        format.json { render json: @join_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_order_items/1
  # PATCH/PUT /join_order_items/1.json
  def update
    respond_to do |format|
      if @join_order_item.update(join_order_item_params)
        format.html { redirect_to @join_order_item, notice: 'Join order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_order_item }
      else
        format.html { render :edit }
        format.json { render json: @join_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_order_items/1
  # DELETE /join_order_items/1.json
  def destroy
    @join_order_item.destroy
    respond_to do |format|
      format.html { redirect_to join_order_items_url, notice: 'Join order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_order_item
      @join_order_item = JoinOrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def join_order_item_params
      params.require(:join_order_item).permit(:order_id, :item_id, :quantity)
    end
end
