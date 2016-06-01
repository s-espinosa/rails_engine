require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/random" do
  it "returns a random invoice" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/random"

    expect([invoice1[:id], invoice2[:id]]).to include(json_body["id"])
  end
end
