require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = create(:product)
  end

  test "should not get index without authentication" do
    get :index
    assert_equal(response.status, 401)
  end

  test "should get index" do
    authenticate(request)
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    authenticate(request)
    get :new
    assert_response :success
  end

  test "should create product" do
    authenticate(request)
    assert_difference('Product.count') do
      post :create, product: { name: @product.name, price: @product.price }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    authenticate(request)
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    authenticate(request)
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    authenticate(request)
    patch :update, id: @product, product: { name: @product.name, price: @product.price }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    authenticate(request)
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  def authenticate(request)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('adam', 'test123')
  end
end
