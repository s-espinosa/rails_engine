require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/find_all?parameters=:parameters" do
  it "returns all transactions with an invoice_id" do
    invoice1, invoice2 = create_list(:invoice, 2)
    transaction1, transaction2 = create_list(:transaction, 2, invoice_id: invoice1.id)

    get "/api/v1/transactions/find_all?invoice_id=#{invoice1.id}"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1.id)
    expect(first_transaction["invoice_id"]).to eq(invoice1.id)
  end

  it "returns all transactions with a credit_card_number" do
    transaction1, transaction2 = create_list(:transaction, 2, credit_card_number: "4654405418249632")
    transaction3 = create(:transaction, credit_card_number: "4654405418243333")

    get "/api/v1/transactions/find_all?credit_card_number=4654405418249632"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1[:id])
    expect(first_transaction["credit_card_number"]).to eq("4654405418249632")
  end

  it "returns all transactions with a given result" do
    transaction1, transaction2 = create_list(:transaction, 2, result: "success")
    transaction3 = create(:transaction, result: "failed")

    get "/api/v1/transactions/find_all?result=success"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1.id)
    expect(first_transaction["result"]).to eq("success")
  end
end
