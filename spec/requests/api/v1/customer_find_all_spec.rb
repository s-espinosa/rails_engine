require 'rails_helper'

RSpec.describe "GET /api/v1/customers/find_all?parameters=:parameters" do
  it "returns all customers with a name" do
    customer1 = create(:customer, name: "Customer")
    customer2 = create(:customer, name: "Customer")

    get "/api/v1/customers/find_all?name=Customer"

    expect(json_body.count).to eq(2)
    first_customer = json_body[0]
    expect(first_customer["id"]).to eq(customer1[:id])
    expect(first_customer["name"]).to eq("Customer")
  end
end
