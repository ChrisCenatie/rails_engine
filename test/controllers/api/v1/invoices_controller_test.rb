require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all invoices" do
    number_of_invoices = Customer.count
    get :index, format: :json

    json_response

    assert_equal number_of_invoices, json_response.count
  end

  test "#show" do
    invoice = invoices(:one)
    get :show, format: :json, id: invoice.id

    assert_response :success
  end

  test "#show returns the correct invoice data" do
    invoice = invoices(:one)
    get :show, format: :json, id: invoice.id

    assert_response :success
    assert_equal json_response["id"], invoice.id
  end

  test "#find returns the correct invoice data by merchant id" do
    merchant_id = invoices(:one).merchant_id
    get :find, format: :json, first_name: merchant_id

    assert_response :success
    assert_equal json_response["id"], invoices(:one).id
  end

  test "#find_all returns the correct invoice data by status" do
    get :find_all, format: :json, status: "incomplete"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
