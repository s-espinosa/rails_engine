require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/find?parameters=:parameters" do
  it "returns an invoice with an id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    expect(json_body["id"]).to eq(invoice.id)
    expect(json_body["customer_id"]).to eq(invoice.customer_id)
  end

  it "returns an invoice with a customer_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

    expect(json_body["id"]).to eq(invoice.id)
    expect(json_body["customer_id"]).to eq(invoice.customer_id)
  end

  it "returns an invoice with a merchant_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

    expect(json_body["id"]).to eq(invoice.id)
    expect(json_body["customer_id"]).to eq(invoice.customer_id)
  end

  it "returns an invoice with a given status" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    expect(json_body["id"]).to eq(invoice.id)
    expect(json_body["customer_id"]).to eq(invoice.customer_id)
  end
end
