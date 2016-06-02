require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id/customer" do
  it "returns the customer associated with an invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(json_body["id"]).to eq(invoice.customer.id)
  end
end
