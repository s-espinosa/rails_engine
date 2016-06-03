require 'rails_helper'

RSpec.describe "GET /api/v1/items/find?parameters=:parameters" do
  it "returns an item with an id" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end

  it "returns an item with a name" do
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end

  it "returns an item with a description" do
    item = create(:item)

    get "/api/v1/items/find?description=#{item.description}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end

  it "returns an item with a unit_price" do
    item = create(:item)

    get "/api/v1/items/find?unit_price=#{item.unit_price/100.0}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end

  it "returns an items with a merchant_id" do
    item = create(:item)

    get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end
end
