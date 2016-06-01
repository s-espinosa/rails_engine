require 'rails_helper'

RSpec.describe "GET /api/v1/items/random" do
  it "returns a random item" do
    merchant = Merchant.create(name: "Merchant")
    item1 = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)
    item2 = Item.create(name: "Item2", description: "Item2 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/random"

    expect([item1.name, item2.name]).to include(json_body["name"])
  end
end
