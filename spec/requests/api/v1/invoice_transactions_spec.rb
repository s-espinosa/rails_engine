require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id/transactions" do
  it "returns all transactions associated with an invoice" do
    invoice = create(:invoice)
    transaction1, transaction2 = create_list(:transaction, 2, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1.id)
  end
end
