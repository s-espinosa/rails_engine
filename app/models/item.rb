class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_items(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity) DESC').limit("#{quantity}")
  end

  def self.most_revenue(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price) DESC').limit("#{quantity}")
  end
end
