require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/find?parameters=:parameters" do
  it "returns an invoice_item with an id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json_body["unit_price"]).to eq((invoice_item.unit_price/100.0).to_s)
  end

  it "returns an invoice_item with an invoice_id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json_body["unit_price"]).to eq((invoice_item.unit_price/100.0).to_s)
  end

  it "returns an invoice_item with an item_id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

    expect(json_body["id"]).to eq(invoice_item.id)
    expect(json_body["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json_body["unit_price"]).to eq((invoice_item.unit_price/100.0).to_s)
  end
end
