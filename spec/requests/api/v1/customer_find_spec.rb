require 'rails_helper'

RSpec.describe "GET /api/v1/customers/find?parameters=:parameters" do
  it "returns a customer with an id" do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    expect(json_body["id"]).to eq(customer.id)
    expect(json_body["last_name"]).to eq(customer.last_name)
  end

  it "returns a customer with a given first name" do
    customer = create(:customer)

    get "/api/v1/customers/find?first_name=#{customer.first_name}"

    expect(json_body["id"]).to eq(customer.id)
    expect(json_body["last_name"]).to eq(customer.last_name)
  end


  it "returns a customer with a given last name" do
    customer = create(:customer)

    get "/api/v1/customers/find?last_name=#{customer.last_name}"

    expect(json_body["id"]).to eq(customer.id)
    expect(json_body["last_name"]).to eq(customer.last_name)
  end
end
