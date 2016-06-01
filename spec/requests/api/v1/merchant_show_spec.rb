require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/:id" do
  it "returns a single merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant[:id]}"

    expect(json_body["id"]).to eq(merchant[:id])
    expect(json_body["name"]).to eq(merchant[:name])
  end
end
