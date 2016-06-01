require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/random" do
  it "returns a random transaction" do
    transaction1, transaction2 = create_list(:transaction, 2)

    get "/api/v1/transactions/random"

    expect([transaction1.id, transaction2.id]).to include(json_body["id"])
  end
end
