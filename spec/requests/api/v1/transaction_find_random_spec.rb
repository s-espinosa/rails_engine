require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/random" do
  it "returns a random transaction" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/random"

    expect([transaction1[:id], transaction2[:id]]).to include(json_body["id"])
  end
end
