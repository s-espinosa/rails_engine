require 'rails_helper'

RSpec.describe "GET /api/v1/invoices" do
  it "returns a list of invoices" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["name"]).to eq(invoice1[:name])
  end
end
