require 'csv'

namespace :import_all_csv do
  desc "Import all csv files"
  task :import => [:environment] do
    customers = Rails.root.join('db/data', 'customers.csv')
    invoice_items = Rails.root.join('db/data', 'invoice_items.csv')
    invoices = Rails.root.join('db/data', 'invoices.csv')
    items = Rails.root.join('db/data', 'items.csv')
    merchants = Rails.root.join('db/data', 'merchants.csv')
    transactions = Rails.root.join('db/data', 'transactions.csv')

    CSV.foreach(customers, headers: true) do |row|
      Customer.create row.to_h
    end

    CSV.foreach(merchants, headers: true) do |row|
      Merchant.create row.to_h
    end

    CSV.foreach(items, headers: true) do |row|
      Item.create row.to_h
    end

    CSV.foreach(invoices, headers: true) do |row|
      Invoice.create row.to_h
    end

    CSV.foreach(transactions, headers: true) do |row|
      Transaction.create row.to_h
    end

    CSV.foreach(invoice_items, headers: true) do |row|
      InvoiceItem.create row.to_h
    end
  end
end
