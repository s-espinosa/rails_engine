require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id/invoice_items" do
  it "returns all invoice_items associated with an invoice" do
    invoice = create(:invoice)
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(json_body.count).to eq(2)
    first_invoice_item = json_body[0]
    expect(first_invoice_item["id"]).to eq(invoice_item1.id)
  end
end
