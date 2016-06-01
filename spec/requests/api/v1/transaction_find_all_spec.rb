require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/find_all?parameters=:parameters" do
  it "returns all transactions with an invoice_id" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")
    transaction3 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4580251236515201", credit_card_expiration_date: "", result: "success")

    get "/api/v1/transactions/find_all?invoice_id=#{invoice1.id}"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1[:id])
    expect(first_transaction["invoice_id"]).to eq(invoice1.id)
  end

  it "returns all transactions with a credit_card_number" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")
    transaction3 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4580251236515201", credit_card_expiration_date: "", result: "success")

    get "/api/v1/transactions/find_all?credit_card_number=4654405418249632"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1[:id])
    expect(first_transaction["credit_card_number"]).to eq("4654405418249632")
  end

  it "returns all transactions with a given status" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")
    transaction3 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4580251236515201", credit_card_expiration_date: "", result: "success")

    get "/api/v1/transactions/find_all?result=success"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
    expect(first_transaction["id"]).to eq(transaction1[:id])
    expect(first_transaction["result"]).to eq("success")
  end
end
