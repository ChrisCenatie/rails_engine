require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all merchants" do
    number_of_merchants = Merchant.count
    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_merchants, json_response.count
  end

  test "#show" do
    merchant = merchants(:one)
    get :show, format: :json, id: merchant.id

    assert_response :success
  end

  test "#show returns the correct merchant data" do
    merchant = merchants(:one)
    get :show, format: :json, id: merchant.id

    assert_response :success
    assert_equal json_response["id"], merchant.id
    assert_equal json_response["name"], merchant.name
  end

  test "#find returns the correct merchant data by name" do
    merchant_name = merchants(:one).name
    get :find, format: :json, name: merchant_name

    assert_response :success
    assert_equal json_response["id"], merchants(:one).id
    assert_equal json_response["name"], merchants(:one).name
  end

  test "#find returns the correct merchant data by id" do
    merchant_id = merchants(:one).id
    get :find, format: :json, id: merchant_id

    assert_response :success
    assert_equal json_response["id"], merchants(:one).id
    assert_equal json_response["name"], merchants(:one).name
  end

  test "#find by name is case insensitive" do
    merchant = merchants(:one)
    get :find, format: :json, name: "damm music center"

    assert_response :success
    assert_equal json_response["id"], merchant.id
    assert_equal json_response["name"], merchant.name
  end

  test "#find_all returns the correct merchant data by name" do
    merchant_name = merchants(:one).name
    get :find_all, format: :json, name: merchant_name

    assert_response :success
    assert_equal 2, json_response.count
  end

  test "#find_all by name is case insensitive" do
    merchant = merchants(:one)
    get :find_all, format: :json, name: "damm music center"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
