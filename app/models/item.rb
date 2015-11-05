class Item < ActiveRecord::Base
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_create :money_converter

  protected

  def money_converter
    self.unit_price = (self.unit_price / 100.00)
  end
end
