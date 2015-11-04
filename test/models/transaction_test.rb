require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transaction belongs to invoice" do
    invoice = invoices(:one)
    transaction = transactions(:one)
    invoice.transactions << transaction

    assert_equal invoice.transactions.first, transaction
    assert_equal transaction.invoice,        invoice
  end
end
