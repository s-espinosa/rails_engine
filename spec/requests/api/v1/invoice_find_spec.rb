require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/find?parameters=:parameters" do
  it "returns an invoice with an id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice[:id]}"

    expect(json_body["id"]).to eq(invoice[:id])
    expect(json_body["customer_id"]).to eq(invoice[:customer_id])
  end

  xit "returns a invoice with a created_at" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice  = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/find?created_at=#{invoice[:created_at]}"

    expect(json_body["id"]).to eq(invoice[:id])
    expect(json_body["name"]).to eq(invoice[:name])
  end

  xit "returns a invoice with an updated_at" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice  = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/find?updated_at=#{invoice[:updated_at]}"

    expect(json_body["id"]).to eq(invoice[:id])
    expect(json_body["name"]).to eq(invoice[:name])
  end
end
