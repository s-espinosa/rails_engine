require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/find?parameters=:parameters" do
  it "returns a merchant with an id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(json_body["id"]).to eq(merchant.id)
    expect(json_body["name"]).to eq(merchant.name)
  end

  it "returns a merchant with a name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(json_body["id"]).to eq(merchant.id)
    expect(json_body["name"]).to eq(merchant.name)
  end
end
