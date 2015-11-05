class Item < ActiveRecord::Base
  default_scope{order(:id)}
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_create :money_converter

  protected

  def money_converter
    self.unit_price = (self.unit_price/100)
  end
end
