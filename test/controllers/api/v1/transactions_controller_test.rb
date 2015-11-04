require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all transactions" do
    number_of_transactions = Transaction.count
    get :index, format: :json

    json_response

    assert_equal number_of_transactions, json_response.count
  end

  test "#show" do
    transactions = transactions(:one)
    get :show, format: :json, id: transactions.id

    assert_response :success
  end

  test "#show returns the correct transactions data" do
    transactions = transactions(:one)
    get :show, format: :json, id: transactions.id

    assert_response :success
    assert_equal json_response["id"], transactions.id
  end

  test "#find returns the correct transactions data by result" do
    result = transactions(:one).result
    get :find, format: :json, first_name: result

    assert_response :success
    assert_equal json_response["id"], transactions(:one).id
  end

  test "#find_all returns the correct transactions data by status" do
    get :find_all, format: :json, result: "success"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
