require 'rails_helper'

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of customers" do
    customer1, customer2 = create_list(:customer, 2)

    get "/api/v1/customers"

    expect(json_body.count).to eq(2)
    first_customer = json_body[0]
    expect(first_customer["id"]).to eq(customer1[:id])
    expect(first_customer["name"]).to eq(customer1[:name])
  end
end
