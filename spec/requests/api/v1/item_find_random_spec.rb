require 'rails_helper'

RSpec.describe "GET /api/v1/items/random" do
  it "returns a random item" do
    merchant = create(:merchant)
    item1, item2 = create_list(:item, 2, merchant_id: merchant.id)

    get "/api/v1/items/random"

    expect([item1.name, item2.name]).to include(json_body["name"])
  end
end
