require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items" do
  it "returns a list of invoice_items" do
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)

    get "/api/v1/invoice_items"

    expect(json_body.count).to eq(2)
    first_invoice_item = json_body[0]
    expect(first_invoice_item["id"]).to eq(invoice_item1.id)
    expect(first_invoice_item["item_id"]).to eq(invoice_item1.item_id)
  end
end
