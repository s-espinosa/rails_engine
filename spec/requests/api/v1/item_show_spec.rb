require 'rails_helper'

RSpec.describe "GET /api/v1/items/:id" do
  it "returns a single item" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/#{item[:id]}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end
end
