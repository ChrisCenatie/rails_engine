require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item belongs to merchant" do
    merchant = Merchant.create(name: "Merchant Test")
    item    = Item.create(name: "Item Test", description: "Item Testing", unit_price: 20.01)
    merchant.items << item

    assert_equal item.merchant,    merchant
    assert_equal item.merchant_id, merchant.id
  end
end
