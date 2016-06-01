require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/find_all?parameters=:parameters" do
  it "returns all merchants with a name" do
    merchant1 = create(:merchant, name: "Merchant")
    merchant2 = create(:merchant, name: "Merchant")

    get "/api/v1/merchants/find_all?name=Merchant"

    expect(json_body.count).to eq(2)
    first_merchant = json_body[0]
    expect(first_merchant["id"]).to eq(merchant1[:id])
    expect(first_merchant["name"]).to eq("Merchant")
  end
end
