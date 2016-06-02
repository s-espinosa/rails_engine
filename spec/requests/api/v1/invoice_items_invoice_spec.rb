require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/:id/invoice" do
  it "returns the invoice associated with an invoice_item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(json_body["id"]).to eq(invoice_item.invoice.id)
  end
end
