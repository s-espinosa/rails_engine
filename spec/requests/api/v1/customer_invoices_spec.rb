require 'rails_helper'

RSpec.describe "GET /api/v1/customers/:id/invoices" do
  it "returns the invoice associated with a given customer" do
    customer = create(:customer)
    invoice1, invoice2 = create_list(:invoice, 2, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1.id)
  end
end
