require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order)
    assert_not_nil assigns(:order).customer, '@order should have a blank customer'
  end

  test "should create order" do
    assert_difference('Order.count') do
      product = create(:product)

      xhr :post, :create, order: {
        quantity: 2,
        product_id: product.id,
        customer_attributes: {
          name: 'homer',
          email: 'homer@example.com',
          address: '724 evergreen terrace',
          city: 'sprinfield',
          country: 'usa',
          credit_card: '4111111111111111',
          expiry: '012018'
        }
      }
    end

    assert_response :success
    assert_template :create
  end

end
