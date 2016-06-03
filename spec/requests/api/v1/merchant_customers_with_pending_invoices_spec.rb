require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/customers_with_pending_invoices" do
  it "returns a collection of customers which have pending (unpaid) invoices" do
    customer1, customer2 = create_list(:customer, 2)
    merchant1            = create(:merchant)
    invoice1, invoice2   = create_list(:invoice, 2, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice3             = create(:invoice, merchant_id: merchant1.id, customer_id: customer2.id)
    transaction1         = create(:transaction, invoice_id: invoice1.id, result: "failed")
    transaction2         = create(:transaction, invoice_id: invoice2.id, result: "success")
    transaction3         = create(:transaction, invoice_id: invoice3.id, result: "success")

    get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

    expect(json_body["id"]).to eq(customer1.id)
    expect(json_body["name"]).to eq(customer1.name)
  end
end
