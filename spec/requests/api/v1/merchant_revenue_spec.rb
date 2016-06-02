require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/revenue" do
  it "returns the top x merchants ranked by items sold" do
    merchant1 = create(:merchant)
    item = create(:item, merchant_id: merchant1.id)
    invoice1, invoice2 = create_list(:invoice, 2, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item.id, invoice_id: invoice1.id, quantity: 2)
    invoice_item2 = create(:invoice_item, item_id: item.id, invoice_id: invoice2.id, quantity: 1)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/merchants/#{merchant1.id}/revenue"

    expect(json_body.count).to eq(1)
    first_transaction = json_body[0]
  end
end
