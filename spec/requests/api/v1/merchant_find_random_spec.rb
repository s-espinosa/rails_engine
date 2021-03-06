require 'rails_helper'

RSpec.describe "GET /api/v1/merchants/random" do
  it "returns a random merchant" do
    merchant1, merchant2 = create_list(:merchant, 2)

    get "/api/v1/merchants/random"

    expect([merchant1.name, merchant2.name]).to include(json_body["name"])
  end
end
