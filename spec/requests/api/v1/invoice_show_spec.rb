require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/:id" do
  it "returns a single invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice[:id]}"

    expect(json_body["id"]).to eq(invoice[:id])
    expect(json_body["name"]).to eq(invoice[:name])
  end
end
