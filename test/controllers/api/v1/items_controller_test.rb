require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all items" do
    number_of_items = Item.count
    get :index, format: :json

    assert_equal number_of_items, json_response.count
  end

  test "#show" do
    item = items(:one)
    get :show, format: :json, id: item.id

    assert_response :success
  end

  test "#show returns the correct item data" do
    item = items(:one)
    get :show, format: :json, id: item.id

    assert_response :success
    assert_equal json_response["id"], item.id
  end

  test "#find returns the correct item data by name" do
    item_name = items(:one).name
    get :find, format: :json, name: item_name

    assert_response :success
    assert_equal json_response["id"], items(:one).id
    assert_equal json_response["name"], items(:one).name
  end

  test "#find returns the correct item data by id" do
    item_id = items(:one).id
    get :find, format: :json, id: item_id

    assert_response :success
    assert_equal json_response["id"], items(:one).id
    assert_equal json_response["name"], items(:one).name
  end

  test "#find by name is case insensitive" do
    item = items(:one)
    get :find, format: :json, name: "GuITAR"

    assert_response :success
    assert_equal json_response["id"], item.id
    assert_equal json_response["name"], item.name
  end

  test "#find_all returns the correct item data by name" do
    item_name = items(:one).name
    get :find_all, format: :json, name: item_name

    assert_response :success
    assert_equal 2, json_response.count
  end

  test "#find_all by name is case insensitive" do
    item = items(:one)
    get :find_all, format: :json, name: "GuiTaR"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
