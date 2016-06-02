class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  has_many :transactions, through: :invoice
  has_many :merchants, through: :invoice
end
