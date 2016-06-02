require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/:id/item" do
  it "returns the item associated with an invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(json_body["id"]).to eq(invoice_item.item.id)
  end
end
