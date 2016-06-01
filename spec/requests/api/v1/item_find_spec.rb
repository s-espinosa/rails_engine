require 'rails_helper'

RSpec.describe "GET /api/v1/items/find?parameters=:parameters" do
  it "returns an item with an id" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?id=#{item[:id]}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  it "returns an item with a name" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?name=#{item[:name]}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  it "returns an item with a description" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?description=Item1%20description"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  it "returns all items with a unit_price" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?unit_price=4.50"
    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  xit "returns all items with a merchant_id" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  xit "returns a item with a created_at" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?created_at=#{item[:created_at]}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end

  xit "returns a item with an updated_at" do
    merchant = Merchant.create(name: "Merchant")
    item = Item.create(name: "Item1", description: "Item1 description", unit_price: 450, merchant_id: merchant.id)

    get "/api/v1/items/find?updated_at=#{item[:updated_at]}"

    expect(json_body["id"]).to eq(item[:id])
    expect(json_body["name"]).to eq(item[:name])
  end
end
