require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/find_all?parameters=:parameters" do
  it "returns all invoices with a customer_id" do
    customer = create(:customer)
    merchant1, merchant2 = create_list(:merchant, 2)
    invoice1 = Invoice.create(customer_id: customer.id, merchant_id: merchant1.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: merchant2.id, status: "shipped")

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["customer_id"]).to eq(customer.id)
  end

  it "returns all invoices with a merchant_id" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["merchant_id"]).to eq(merchant.id)
  end

  it "returns all invoices with a given status" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice3 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "pending")

    get "/api/v1/invoices/find_all?status=shipped"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["status"]).to eq("shipped")
  end
end
