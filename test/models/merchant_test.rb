require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test "merchant has a name" do
    merchant = Merchant.create(name: "Merchant Test")

    assert_equal merchant.name, "Merchant Test"
  end

  test "merchant has many items" do
    merchant = Merchant.create(name: "Merchant Test")
    item1    = Item.create(name: "Item Test", description: "Item Testing", unit_price: 20.01)
    item2    = Item.create(name: "Item 2 Test", description: "Item 2 Testing", unit_price: 15)

    assert_equal merchant.items.count, 0

    merchant.items << item1
    merchant.items << item2

    assert_equal merchant.items.count, 2
    assert_equal merchant.items.first.id, item1.id
    assert_equal merchant.items.last.id,  item2.id
  end
end
