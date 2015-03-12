class OrdersController < ApplicationController

  # GET /orders
  # GET /orders.json
  def index
    @order = Order.new # for the new order form
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        format.js
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:quantity, :product_id)
    end
end
