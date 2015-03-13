namespace :moe do

  desc "mark order(s) as shipped. ship order specified by id param or all unshipped orders if no id is given"
  task :ship, [:id] => :environment do |t, args|
    if (args[:id].nil?)
      # no id passed in, ship everything
      Order.all.each do |order|
        if (order && !order.shipped)
          order.shipped = true
          order.save
          puts "Order #{order.id} set as shipped"
        end
      end
    else
      # id passed in, just ship the order specified
      order = Order.where('id = ?', args[:id]).take
      if (order && !order.shipped)
        order.shipped = true
        order.save
        puts "Order #{order.id} set as shipped"
      end
    end
  end

  desc "generate test sales. optional param to specify number of orders to create"
  task :sale, [:num] => :environment do |t, args|
    num = 1
    num = args[:num].to_i if args[:num]
    for i in 1..num do
      order = build_order
      # slow this down a little so we can see it update the ui in real time
      sleep(3)
    end
  end

  def build_order
    customer = Customer.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      country: Faker::Address.country,
      credit_card: Faker::Business.credit_card_number,
      expiry: Faker::Business.credit_card_expiry_date.strftime('%m%Y')
    )

    product = Product.where(id: rand(1..4)).take
    
    order = Order.create(
      customer: customer,
      product: product,
      quantity: rand(1..5),
      shipped: false
    )
    order
  end

end
