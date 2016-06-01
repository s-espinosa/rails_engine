require 'rails_helper'

RSpec.describe "GET /api/v1/merchants" do
  it "returns a list of merchants" do
    merchant1, merchant2 = create_list(:merchant, 2)

    get "/api/v1/merchants"

    expect(json_body.count).to eq(2)
    first_merchant = json_body[0]
    expect(first_merchant["id"]).to eq(merchant1[:id])
    expect(first_merchant["name"]).to eq(merchant1[:name])
  end
end
