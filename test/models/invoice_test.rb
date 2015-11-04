require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "invoice belongs to customer and merchant" do
    merchant = merchants(:one)
    customer = customers(:one)
    merchant.invoices << invoices(:one)
    customer.invoices << invoices(:one)

    assert_equal invoices(:one).customer, customer
    assert_equal invoices(:one).merchant, merchant
  end
end
