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

  test "#invoice returns the invoice associated with the invoice_item" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    item = Item.create(name: "Guitar", description: "Electric", unit_price: 100,
                       merchant_id: merchant.id)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id,
                                       quantity: 20, unit_price: 100)

    get :invoice, format: :json, id: invoice_item.id

    assert_response :success
    assert_equal invoice[:status], json_response["status"]
  end

  test "#item returns the item associated with the invoice_item" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    item = Item.create(name: "Guitar", description: "Electric", unit_price: 100,
                       merchant_id: merchant.id)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id,
                                       quantity: 20, unit_price: 100)

    get :item, format: :json, id: invoice_item.id

    assert_response :success
    assert_equal item[:name], json_response["name"]
  end
end
