require 'rails_helper'

RSpec.describe "GET /api/v1/transactions" do
  it "returns a list of transactions" do
    transaction1, transaction2 = create_list(:transaction, 2)

    get "/api/v1/transactions"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1.id)
    expect(first_transaction["result"]).to eq(transaction1.result)
  end
end
