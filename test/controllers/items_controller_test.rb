require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { buyout_price: @item.buyout_price, city: @item.city, delivered: @item.delivered, description: @item.description, name: @item.name, starting_price: @item.starting_price, state: @item.state, street_address: @item.street_address, zip: @item.zip }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { buyout_price: @item.buyout_price, city: @item.city, delivered: @item.delivered, description: @item.description, name: @item.name, starting_price: @item.starting_price, state: @item.state, street_address: @item.street_address, zip: @item.zip }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
