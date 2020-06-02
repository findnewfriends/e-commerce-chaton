require 'test_helper'

class JoinOrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_order_item = join_order_items(:one)
  end

  test "should get index" do
    get join_order_items_url
    assert_response :success
  end

  test "should get new" do
    get new_join_order_item_url
    assert_response :success
  end

  test "should create join_order_item" do
    assert_difference('JoinOrderItem.count') do
      post join_order_items_url, params: { join_order_item: { item_id: @join_order_item.item_id, order_id: @join_order_item.order_id, quantity: @join_order_item.quantity } }
    end

    assert_redirected_to join_order_item_url(JoinOrderItem.last)
  end

  test "should show join_order_item" do
    get join_order_item_url(@join_order_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_order_item_url(@join_order_item)
    assert_response :success
  end

  test "should update join_order_item" do
    patch join_order_item_url(@join_order_item), params: { join_order_item: { item_id: @join_order_item.item_id, order_id: @join_order_item.order_id, quantity: @join_order_item.quantity } }
    assert_redirected_to join_order_item_url(@join_order_item)
  end

  test "should destroy join_order_item" do
    assert_difference('JoinOrderItem.count', -1) do
      delete join_order_item_url(@join_order_item)
    end

    assert_redirected_to join_order_items_url
  end
end
