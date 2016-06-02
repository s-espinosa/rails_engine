require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id/items" do
  it "returns all items associated with a merchant" do
    merchant1, merchant2 = create_list(:merchant,2)
    item1, item2         = create_list(:item, 2, merchant_id: merchant1.id)
    item3                = create(:item, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(json_body.count).to eq(2)
    first_item = json_body[0]
    expect(first_item["id"]).to eq(item1.id)
  end
end
