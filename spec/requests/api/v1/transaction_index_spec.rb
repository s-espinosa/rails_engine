require 'rails_helper'

RSpec.describe "GET /api/v1/transactions" do
  it "returns a list of transactions" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1[:id])
    expect(first_transaction["result"]).to eq(transaction1[:result])
  end
end
