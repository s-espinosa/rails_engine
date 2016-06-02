class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').limit("#{quantity}")
  end

  def self.most_items(quantity)
    joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order('sum(invoice_items.quantity) DESC').limit("#{quantity}")
  end
end
