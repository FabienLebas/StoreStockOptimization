require 'test_helper'

class EiProductsControllerTest < ActionController::TestCase
  setup do
    @ei_product = ei_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ei_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ei_product" do
    assert_difference('EiProduct.count') do
      post :create, ei_product: { name: @ei_product.name, price: @ei_product.price }
    end

    assert_redirected_to ei_product_path(assigns(:ei_product))
  end

  test "should show ei_product" do
    get :show, id: @ei_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ei_product
    assert_response :success
  end

  test "should update ei_product" do
    put :update, id: @ei_product, ei_product: { name: @ei_product.name, price: @ei_product.price }
    assert_redirected_to ei_product_path(assigns(:ei_product))
  end

  test "should destroy ei_product" do
    assert_difference('EiProduct.count', -1) do
      delete :destroy, id: @ei_product
    end

    assert_redirected_to ei_products_path
  end
end
