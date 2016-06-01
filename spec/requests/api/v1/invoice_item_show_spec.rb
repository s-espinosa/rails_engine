require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/:id" do
  it "returns a single invoice_item" do
    invoice_item  = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(json_body["id"]).to eq(invoice_item[:id])
    expect(json_body["item_id"]).to eq(invoice_item.item_id)
  end
end
