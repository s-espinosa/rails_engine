require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/invoices" do
  it "returns all items associated with a merchant" do
    merchant1, merchant2 = create_list(:merchant,2)
    invoice1, invoice2         = create_list(:invoice, 2, merchant_id: merchant1.id)
    invoice3                = create(:invoice, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1.id)
  end
end
