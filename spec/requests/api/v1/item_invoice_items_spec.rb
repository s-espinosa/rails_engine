require 'rails_helper'

RSpec.describe "GET /api/v1/items/:id/items" do
  it "returns the invoice_items associated with an item" do
    item = create(:item)
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(json_body.count).to eq(2)
    first_invoice_item = json_body[0]
    expect(first_invoice_item["id"]).to eq(invoice_item1.id)
  end
end
