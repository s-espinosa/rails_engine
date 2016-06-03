require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/find?parameters=:parameters" do
  it "returns a transaction with an id" do
    transaction1 = create(:transaction)

    get "/api/v1/transactions/find?id=#{transaction1.id}"

    expect(json_body["id"]).to eq(transaction1.id)
    expect(json_body["invoice_id"]).to eq(transaction1.invoice_id)
  end

  it "returns an transaction with a credit_card_number" do
    transaction1 = create(:transaction)

    get "/api/v1/transactions/find?credit_card_number=#{transaction1.credit_card_number}"

    expect(json_body["id"]).to eq(transaction1.id)
    expect(json_body["credit_card_number"]).to eq(transaction1.credit_card_number)
  end

  it "returns an transaction with an id" do
    transaction1 = create(:transaction)

    get "/api/v1/transactions/find?result=#{transaction1.result}"

    expect(json_body["id"]).to eq(transaction1.id)
    expect(json_body["result"]).to eq(transaction1.result)
  end
end
