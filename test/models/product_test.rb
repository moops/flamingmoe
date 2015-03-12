require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'name is required' do
    product = build(:product, name: nil)
    assert_not product.save, 'product should require a name'
  end

  test 'price is required' do
    product = build(:product, price: nil)
    assert_not product.save, 'product should require a price'
  end

end
