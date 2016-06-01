require 'rails_helper'

RSpec.describe "GET /api/v1/items/:id" do
  it "returns a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(json_body["id"]).to eq(item.id)
    expect(json_body["name"]).to eq(item.name)
  end
end
