require 'rails_helper'

RSpec.describe "GET /api/v1/customers/find_all?parameters=:parameters" do
  it "returns all customers with a name" do
    customer1 = create(:customer, first_name: "Customer", last_name: "One")
    customer2 = create(:customer, first_name: "Customer", last_name: "Two")

    get "/api/v1/customers/find_all?first_name=Customer"

    expect(json_body.count).to eq(2)
    first_customer = json_body[0]
    expect(first_customer["id"]).to eq(customer1[:id])
    expect(first_customer["last_name"]).to eq("One")
  end
end
