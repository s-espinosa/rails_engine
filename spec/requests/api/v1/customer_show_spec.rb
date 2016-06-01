require 'rails_helper'

RSpec.describe "GET /api/v1/customers/:id" do
  it "returns a single customer" do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(json_body["id"]).to eq(customer.id)
    expect(json_body["first_name"]).to eq(customer.first_name)
  end
end
