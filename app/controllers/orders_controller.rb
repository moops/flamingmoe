class OrdersController < ApplicationController

  # GET /orders
  # GET /orders.json
  def index

    # the order needs a blank customer for the new order form
    @customer = Customer.new
    @order = @customer.orders.build
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    customer_params = order_params[:customer_attributes]
    logger.debug("building order customer with: #{customer_params.inspect}")

    # find a customer by email or build a new one
    @customer = Customer.where('email = ?', customer_params[:email]).first if customer_params
    @customer = Customer.new(customer_params) unless @customer
    @order.customer = @customer

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        format.js { render :create }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  # white list parameters
  def order_params
    params.require(:order).permit(
      :quantity,
      :product_id,
      customer_attributes: [:id, :name, :email, :address, :city, :country, :credit_card, :expiry])
  end

end
