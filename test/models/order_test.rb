require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'basic factory' do
    order = build(:order)
    assert_not order.shipped, 'order should not be shipped'
  end

  test 'inherited factory' do
    shipped = build(:shipped_order)
    assert shipped.shipped, 'shipped_order should be shipped'
  end
end
