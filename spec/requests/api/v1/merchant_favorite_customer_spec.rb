require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/favorite_customer" do
  it "returns a favorite customer associated with a merchant" do
    customer1, customer2 = create_list(:customer, 2)
    merchant1            = create(:merchant)
    invoice1, invoice2   = create_list(:invoice, 2, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice3             = create(:invoice, merchant_id: merchant1.id, customer_id: customer2.id)
    transaction1         = create(:transaction, invoice_id: invoice1.id, result: "success")
    transaction2         = create(:transaction, invoice_id: invoice1.id, result: "success")
    transaction3         = create(:transaction, invoice_id: invoice1.id, result: "success")

    get "/api/v1/merchants/#{merchant1.id}/favorite_customer"

    expect(json_body["id"]).to eq(customer1.id)
    expect(json_body["name"]).to eq(customer1.name)
  end
end
