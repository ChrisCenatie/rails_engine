class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  has_many :transactions, through: :invoice
  has_many :merchants, through: :invoice

  before_create :money_converter

  protected

  def money_converter
    self.unit_price = (self.unit_price / 100.00)
  end
end
