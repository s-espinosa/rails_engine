require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/:id" do
  it "returns a single transaction" do
    transaction1 = create(:transaction, result: "success")

    get "/api/v1/transactions/#{transaction1[:id]}"

    expect(json_body["id"]).to eq(transaction1.id)
    expect(json_body["result"]).to eq(transaction1.result)
  end
end
