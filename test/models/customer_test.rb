require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  
  test 'name is required' do
    customer = build(:customer, name: nil)
    assert_not customer.save, 'customer should require a name'
  end

  test 'email is required' do
    customer = build(:customer, email: nil)
    assert_not customer.save, 'customer should require an email'
  end

  test 'address is required' do
    customer = build(:customer, address: nil)
    assert_not customer.save, 'customer should require an address'
  end

  test 'city is required' do
    customer = build(:customer, city: nil)
    assert_not customer.save, 'customer should require a city'
  end

  test 'country is required' do
    customer = build(:customer, country: nil)
    assert_not customer.save, 'customer should require a country'
  end

  test 'credit card is required' do
    customer = build(:customer, credit_card: nil)
    assert_not customer.save, 'customer should require a credit card'
  end

  test 'expiry is required' do
    customer = build(:customer, expiry: nil)
    assert_not customer.save, 'customer should require an expiry'
  end

end
