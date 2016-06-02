require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/:id/invoice" do
  it "returns the invoice associated with an transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(json_body["id"]).to eq(transaction.invoice.id)
  end
end
