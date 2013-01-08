require 'test_helper'

class PlannedOrdersControllerTest < ActionController::TestCase
  setup do
    @planned_order = planned_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_order" do
    assert_difference('PlannedOrder.count') do
      post :create, :planned_order => { :articleCode => @planned_order.articleCode, :creationDate => @planned_order.creationDate, :expectedDeliveryDate => @planned_order.expectedDeliveryDate, :quantity => @planned_order.quantity, :supplier => @planned_order.supplier, :validated => @planned_order.validated }
    end

    assert_redirected_to planned_order_path(assigns(:planned_order))
  end

  test "should show planned_order" do
    get :show, :id => @planned_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @planned_order
    assert_response :success
  end

  test "should update planned_order" do
    put :update, :id => @planned_order, :planned_order => { :articleCode => @planned_order.articleCode, :creationDate => @planned_order.creationDate, :expectedDeliveryDate => @planned_order.expectedDeliveryDate, :quantity => @planned_order.quantity, :supplier => @planned_order.supplier, :validated => @planned_order.validated }
    assert_redirected_to planned_order_path(assigns(:planned_order))
  end

  test "should destroy planned_order" do
    assert_difference('PlannedOrder.count', -1) do
      delete :destroy, :id => @planned_order
    end

    assert_redirected_to planned_orders_path
  end
end
