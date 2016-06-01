require 'rails_helper'

RSpec.describe "GET /api/v1/items" do
  it "returns a list of items" do
    merchant = create(:merchant)
    item1, item2 = create_list(:item, 2, merchant_id: merchant.id)

    get "/api/v1/items"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
    expect(first_item["name"]).to eq(item1.name)
  end
end
