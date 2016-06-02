require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id/merchant" do
  it "returns the merchant associated with an invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(json_body["id"]).to eq(invoice.merchant.id)
  end
end
