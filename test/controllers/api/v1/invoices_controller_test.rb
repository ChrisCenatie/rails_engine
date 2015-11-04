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

  test "#transactions returns all transactions associated with invoice" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    transaction1 = Transaction.create(invoice_id: invoice.id,
                                      credit_card_number: "1234",
                                      credit_card_expiration_date: "10/20",
                                      result: "complete")
    Transaction.create(invoice_id: invoice.id, credit_card_number: "1234",
                       credit_card_expiration_date: "10/20",
                       result: "incomplete")

    get :transactions, format: :json, id: invoice.id

    assert_response :success
    assert_equal 2, json_response.count
    assert_equal transaction1[:status], json_response.first["status"]
  end

  test "#invoice_items returns all invoice_items associated with invoice" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    item = Item.create(name: "Guitar", description: "Electric", unit_price: 100,
                       merchant_id: merchant.id)
    invoice_item1 = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id,
                                       quantity: 20, unit_price: 100)
    InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 100,
                       unit_price: 2000)

    get :invoice_items, format: :json, id: invoice.id

    assert_response :success
    assert_equal 2, json_response.count
    assert_equal "1.0", json_response.first["unit_price"]
  end

  test "#items returns all items associated with invoice" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    item = Item.create(name: "Guitar", description: "Electric", unit_price: 100,
                       merchant_id: merchant.id)
    item2 = Item.create(name: "Bass", description: "Upright", unit_price: 200,
                       merchant_id: merchant.id)
    invoice_item1 = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id,
                                       quantity: 20, unit_price: 100)
    InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 100,
                       unit_price: 2000)

    get :items, format: :json, id: invoice.id

    assert_response :success
    assert_equal 2, json_response.count
    assert_equal item[:name], json_response.first["name"]
  end

  test "#customer returns all customer associated with invoice" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    get :customer, format: :json, id: invoice.id

    assert_response :success
    assert_equal customer[:first_name], json_response["first_name"]
  end

  test "#merchant returns all merchant associated with invoice" do
    customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
    merchant = Merchant.create(name: "Damm Music Center")
    invoice = Invoice.create(customer_id: customer.id,
                             merchant_id: merchant.id, status: "incomplete")
    get :merchant, format: :json, id: invoice.id

    assert_response :success
    assert_equal merchant[:name], json_response["name"]
  end
end
