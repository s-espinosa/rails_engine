require 'rails_helper'

RSpec.describe "GET /api/v1/transactions/find?parameters=:parameters" do
  it "returns an transaction with an id" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/find?id=#{transaction1[:id]}"

    expect(json_body["id"]).to eq(transaction1[:id])
    expect(json_body["invoice_id"]).to eq(transaction1[:invoice_id])
  end

  it "returns an transaction with a credit_card_number" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249333", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/find?credit_card_number=#{transaction1[:credit_card_number]}"

    expect(json_body["id"]).to eq(transaction1[:id])
    expect(json_body["credit_card_number"]).to eq(transaction1[:credit_card_number])
  end

  it "returns an transaction with an id" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/find?result=#{transaction1[:result]}"

    expect(json_body["id"]).to eq(transaction1[:id])
    expect(json_body["result"]).to eq(transaction1[:result])
  end

  xit "returns a transaction with a created_at" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/find?created_at=#{transaction[:created_at]}"

    expect(json_body["id"]).to eq(transaction[:id])
    expect(json_body["created_at"]).to eq(transaction[:created_at])
  end

  xit "returns a transaction with an updated_at" do
    customer1, customer2 = create_list(:customer, 2)
    merchant = create(:merchant)
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant.id, status: "shipped")

    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "failed")

    get "/api/v1/transactions/find?updated_at=#{transaction[:updated_at]}"

    expect(json_body["id"]).to eq(transaction[:id])
    expect(json_body["updated_at"]).to eq(transaction[:updated_at])
  end
end
