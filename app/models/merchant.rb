class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoice_items
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').limit("#{quantity}")
  end

  def self.most_items(quantity)
    joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order('sum(invoice_items.quantity) DESC').limit("#{quantity}")
  end

  def self.revenue(id)
    revenue = find(id).invoice_items.joins(:transactions).where(transactions: {result: "success"}).sum('quantity*unit_price')/100.0
    {"revenue"=>"#{revenue}"}
  end

  def self.favorite_customer(id)
    Merchant.find(id).customers.joins(:transactions).where(transactions: {result: "success"}).group(:id).order('count(invoices.merchant_id) DESC').first
  end
end
