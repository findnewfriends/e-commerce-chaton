require "application_system_test_case"

class JoinOrderItemsTest < ApplicationSystemTestCase
  setup do
    @join_order_item = join_order_items(:one)
  end

  test "visiting the index" do
    visit join_order_items_url
    assert_selector "h1", text: "Join Order Items"
  end

  test "creating a Join order item" do
    visit join_order_items_url
    click_on "New Join Order Item"

    fill_in "Item", with: @join_order_item.item_id
    fill_in "Order", with: @join_order_item.order_id
    fill_in "Quantity", with: @join_order_item.quantity
    click_on "Create Join order item"

    assert_text "Join order item was successfully created"
    click_on "Back"
  end

  test "updating a Join order item" do
    visit join_order_items_url
    click_on "Edit", match: :first

    fill_in "Item", with: @join_order_item.item_id
    fill_in "Order", with: @join_order_item.order_id
    fill_in "Quantity", with: @join_order_item.quantity
    click_on "Update Join order item"

    assert_text "Join order item was successfully updated"
    click_on "Back"
  end

  test "destroying a Join order item" do
    visit join_order_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join order item was successfully destroyed"
  end
end
