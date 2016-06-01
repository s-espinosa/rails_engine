require 'rails_helper'

RSpec.describe "GET /api/v1/items/find_all?parameters=:parameters" do
  it "returns all items with a name" do
    item1, item2 = create_list(:item, 2, name: "Item")

    get "/api/v1/items/find_all?name=Item"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
    expect(first_item["name"]).to eq("Item")
  end

  it "returns all items with a description" do
    item1, item2 = create_list(:item, 2, description: "Item description")

    get "/api/v1/items/find_all?description=Item%20description"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
    expect(first_item["description"]).to eq("Item description")
  end

  it "returns all items with a unit_price" do
    item1, item2 = create_list(:item, 2, unit_price: 450)

    get "/api/v1/items/find_all?unit_price=4%2E50"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
    expect(first_item["unit_price"]).to eq(4.50.to_s)
  end

  it "returns all items with a merchant_id" do
    merchant = create(:merchant)
    item1, item2 = create_list(:item, 2, merchant_id: merchant.id)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
    expect(first_item["merchant_id"]).to eq(merchant.id)
  end
end
