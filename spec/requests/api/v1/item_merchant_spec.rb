require 'rails_helper'

RSpec.describe "GET /api/v1/items/:id/merchant" do
  it "returns the merchant associated with an item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}/merchant"

    expect(json_body["id"]).to eq(item.merchant.id)
  end
end
