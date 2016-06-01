require 'rails_helper'

RSpec.describe "GET /api/v1/invoices" do
  it "returns a list of invoices" do
    invoice1, invoice2 = create_list(:invoice, 2)

    get "/api/v1/invoices"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice1[:id])
    expect(first_invoice["name"]).to eq(invoice1[:name])
  end
end
