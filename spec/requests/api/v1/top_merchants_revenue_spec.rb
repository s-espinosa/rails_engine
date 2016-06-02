require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/most_revenue?quantity=x" do
  it "returns the top x merchants ranked by total revenue" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    item = create(:item, merchant_id: merchant1.id)
    invoice1, invoice2 = create_list(:invoice, 2, merchant_id: merchant1.id)
    invoice3 = create(:invoice, merchant_id: merchant2.id)
    invoice_item1 = create(:invoice_item, item_id: item.id, invoice_id: invoice1.id)
    invoice_item2 = create(:invoice_item, item_id: item.id, invoice_id: invoice2.id)
    invoice_item3 = create(:invoice_item, item_id: item.id, invoice_id: invoice3.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "failed")

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    # expect(first_transaction["id"]).to eq(transaction1.id)
    # expect(first_transaction["invoice_id"]).to eq(invoice1.id)
  end
end
