require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all customers" do
    number_of_customers = Customer.count
    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_customers, json_response.count
  end

  test "#show" do
    customer = customers(:one)
    get :show, format: :json, id: customer.id

    assert_response :success
  end

  test "#show returns the correct customer data" do
    customer = customers(:one)
    get :show, format: :json, id: customer.id

    assert_response :success
    assert_equal json_response["id"], customer.id
    assert_equal json_response["first_name"], customer.first_name
  end

  test "#find returns the correct customer data by first name" do
    customer_name = customers(:one).first_name
    get :find, format: :json, first_name: customer_name

    assert_response :success
    assert_equal json_response["id"], customers(:one).id
    assert_equal json_response["first_name"], customers(:one).first_name
  end

  test "#find returns the correct customer data by last name" do
    customer_name = customers(:one).last_name
    get :find, format: :json, last_name: customer_name

    assert_response :success
    assert_equal json_response["id"], customers(:one).id
    assert_equal json_response["last_name"], customers(:one).last_name
  end

  test "#find returns the correct customer data by id" do
    customer_id = customers(:one).id
    get :find, format: :json, id: customer_id

    assert_response :success
    assert_equal json_response["id"], customers(:one).id
  end

  test "#find by first name is case insensitive" do
    customer = customers(:one)
    get :find, format: :json, first_name: "riCKy"

    assert_response :success
    assert_equal json_response["id"], customer.id
    assert_equal json_response["first_name"], customer.first_name
  end

  test "#find by last name is case insensitive" do
    customer = customers(:one)
    get :find, format: :json, last_name: "BoBBY"

    assert_response :success
    assert_equal json_response["id"], customer.id
    assert_equal json_response["last_name"], customer.last_name
  end

  test "#find_all returns the correct customer data by name" do
    customer_name = customers(:one).last_name
    get :find_all, format: :json, last_name: customer_name

    assert_response :success
    assert_equal 2, json_response.count
  end

  test "#find_all by name is case insensitive" do
    customer = customers(:one)
    get :find_all, format: :json, last_name: "BOBBY"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
