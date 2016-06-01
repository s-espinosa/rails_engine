require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id" do
  it "returns a single invoice" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice  = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/#{invoice[:id]}"

    expect(json_body["id"]).to eq(invoice[:id])
    expect(json_body["name"]).to eq(invoice[:name])
  end
end
