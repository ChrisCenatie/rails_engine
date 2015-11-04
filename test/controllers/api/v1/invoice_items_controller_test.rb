require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index returns all invoice_items" do
    number_of_invoice_items = InvoiceItem.count
    get :index, format: :json

    json_response

    assert_equal number_of_invoice_items, json_response.count
  end

  test "#show" do
    invoice_items = invoice_items(:one)
    get :show, format: :json, id: invoice_items.id

    assert_response :success
  end

  test "#show returns the correct invoice_items data" do
    invoice_items = invoice_items(:one)
    get :show, format: :json, id: invoice_items.id

    assert_response :success
    assert_equal json_response["id"], invoice_items.id
  end

  test "#find returns the correct invoice_items data by quantity" do
    quantity = invoice_items(:one).quantity
    get :find, format: :json, first_name: quantity

    assert_response :success
    assert_equal json_response["id"], invoice_items(:one).id
  end

  test "#find_all returns the correct invoice_items data by status" do
    quantity = invoice_items(:one).quantity
    get :find_all, format: :json, status: "incomplete"

    assert_response :success
    assert_equal 2, json_response.count
  end
end
