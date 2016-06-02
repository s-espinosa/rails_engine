require 'rails_helper'

RSpec.describe "GET /api/v1/customers/:id/transactions" do
  it "returns the transactions associated with a given customer" do
    customer = create(:customer)
    invoice1, invoice2 = create_list(:invoice, 2, customer_id: customer.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1.id)
  end
end
