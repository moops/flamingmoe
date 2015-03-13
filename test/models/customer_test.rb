require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  
  test 'name is required' do
    customer = build(:customer, name: nil)
    assert_not customer.valid?, 'customer should require a name'
  end

  test 'email is required' do
    customer = build(:customer, email: nil)
    assert_not customer.valid?, 'customer should require an email'
  end

  test 'email format' do
    customer = build(:customer, email: 'not_an_email')
    assert_not customer.valid?, 'customer should require a proper email'
  end

  test 'address is required' do
    customer = build(:customer, address: nil)
    assert_not customer.valid?, 'customer should require an address'
  end

  test 'city is required' do
    customer = build(:customer, city: nil)
    assert_not customer.valid?, 'customer should require a city'
  end

  test 'country is required' do
    customer = build(:customer, country: nil)
    assert_not customer.valid?, 'customer should require a country'
  end

  test 'credit card is required' do
    customer = build(:customer, credit_card: nil)
    assert_not customer.valid?, 'customer should require a credit card'
  end

  test 'expiry is required' do
    customer = build(:customer, expiry: nil)
    assert_not customer.valid?, 'customer should require an expiry'
  end

  test 'expiry format' do
    customer = build(:customer, expiry: '01201y')
    assert_not customer.valid?, 'expiry format should only contain numbers'
    customer.expiry = '01201'
    assert_not customer.valid?, 'expiry format should not be less than six characters'
    customer.expiry = '0120188'
    assert_not customer.valid?, 'expiry format should not be more than six characters'
    customer.expiry = '212018'
    assert_not customer.valid?, 'expiry format should start with a 0 or 1'
    customer.expiry = '012018'
    assert customer.valid?, 'expiry format should be valid'
  end

end
