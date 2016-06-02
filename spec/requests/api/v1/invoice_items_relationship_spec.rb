require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id/items" do
  it "returns the items associated with an invoice" do
    item1, item2 = create_list(:item, 2)
    invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
  end
end
