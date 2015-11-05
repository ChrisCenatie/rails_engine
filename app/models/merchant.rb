class Merchant < ActiveRecord::Base
  has_many :items

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoice_count")
                     .joins(invoices: :transactions)
                     .merge(Transaction.successful)
                     .group("customers.id")
                     .order("invoice_count DESC")
                     .first
  end

  def self.most_items(quantity)
    top_seller_ids[0..(quantity.to_i - 1)].map{ |id| Merchant.find(id)}
  end

  def self.top_seller_ids
    Invoice.where(id: successful_invoice_ids).joins(:invoice_items)
           .order('SUM(quantity) DESC').group(:merchant_id).sum(:quantity).keys
  end

  def self.successful_invoice_ids
    Invoice.joins(:transactions).merge(Transaction.successful)
           .pluck(:invoice_id)
  end

  # def self.most_items(_sellers)
  #   ids
  # end
  #
  # def self.merchant_quantities
  #   Merchant.joins(:invoice_items).group(:quantity).count
  # end
  #
  # def self.ids(top_sellers)
  #   merchant_quantities.sort_by{|key, value| value}.reverse
  # end
end
