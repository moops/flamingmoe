class Order < ActiveRecord::Base

  belongs_to :customer
  belongs_to :product

  after_create :push_sale
  after_save :push_counts

  accepts_nested_attributes_for :customer

  # push sale details to pusher.com
  def push_sale

    details = {
      customer_name: self.customer.name,
      customer_city: self.customer.city,
      quantity: self.quantity,
      product: self.product.name,
      sold_at: self.created_at.strftime('%l:%M %p %A')
    }
    Pusher['flamingmoe'].trigger('sale', details)
    logger.debug("pushed sale details to pusher.com: #{details.inspect}")

    push_counts
  end

  # push sale and shipping counts to pusher.com
  def push_counts
    details = {
      total: Order.count,
      shipped: Order.where(shipped: true).count
    }
    Pusher['flamingmoe'].trigger('count', details)
    logger.debug("pushed count details to pusher.com: #{details.inspect}")
  end

  def push_summary
    {
        customer_name: self.customer.name,
        customer_city: self.customer.city,
        quantity: self.quantity,
        product: self.product.name,
        sold_at: self.created_at.strftime('%l:%M %p %A'),
        orders: Order.count,
        shipped: Order.where(shipped: true).count
    }.inspect
  end

end
