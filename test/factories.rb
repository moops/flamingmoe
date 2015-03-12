FactoryGirl.define do
  factory :product do
    name 'container'
    price 2.5
  end

  factory :customer do
    name 'homer'
    email 'homer@example.com'
    address '742 Evergreen Terrace'
    city 'Springfield'
    country 'USA'
    credit_card '4111111111111111'
    expiry '012016'
  end

  factory :order do
    product
    customer
    quantity 2

    factory :shipped_order do
      shipped true
    end
  end

end