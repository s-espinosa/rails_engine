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

  xit "returns an item with a created_at" do
    item = create(:item)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end

  xit "returns a item with an updated_at" do
    item = create(:item)

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end
end
