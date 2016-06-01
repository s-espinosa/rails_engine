require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/find_all?parameters=:parameters" do
  it "returns all invoices with a customer_id" do
    customer = create(:customer)
    invoice1, invoice2 = create_list(:invoice, 2, customer_id: customer.id)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["customer_id"]).to eq(customer.id)
  end

  it "returns all invoices with a merchant_id" do
    merchant = create(:merchant)
    invoice1, invoice2 = create_list(:invoice, 2, merchant_id: merchant.id)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["merchant_id"]).to eq(merchant.id)
  end

  it "returns all invoices with a given status" do
    invoice1, invoice2 = create_list(:invoice, 2, status: "shipped")
    invoice3 = create(:invoice, status: "pending")

    get "/api/v1/invoices/find_all?status=shipped"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["status"]).to eq("shipped")
  end
end
