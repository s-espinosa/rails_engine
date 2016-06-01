require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/find?parameters=:parameters" do
  it "returns an invoice_item with an id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json_body["unit_price"]).to eq((invoice_item.unit_price/100.0).to_s)    
  end

  xit "returns a invoice_item with a created_at" do
    invoice_item  = create(:invoice_item)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["name"]).to eq(invoice_item.name)
  end

  xit "returns a invoice with an updated_at" do
    invoice_item  = create(:invoice_item)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["name"]).to eq(invoice_item.name)
  end
end
