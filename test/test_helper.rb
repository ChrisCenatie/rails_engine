ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json_response
    JSON.parse(response.body)
  end

  # def create_invoices
  # end
  #
  # def invoice1
  #   @invoice1 = Invoice.create(customer_id: customer1.id,
  #                              merchant_id: merchant1.id,
  #                              status: "incomplete")
  # end
  #
  # def invoice2
  #   @invoice = Invoice.create(customer_id: customer.id,
  #                             merchant_id: merchant.id,
  #                             status: "complete")
  # end
  #
  # def merchant1
  #   @merchant1 = Merchant.create(name: "Damm Music Center")
  # end
  #
  # def customer1
  #   @customer = Customer.create(first_name: "Ricky", last_name: "Bobby")
  # end
end
