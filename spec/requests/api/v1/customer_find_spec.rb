require 'rails_helper'

RSpec.describe "GET /api/v1/customers/find?parameters=:parameters" do
  it "returns a customer with an id" do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer[:id]}"

    expect(json_body["id"]).to eq(customer[:id])
    expect(json_body["name"]).to eq(customer[:name])
  end

  it "returns a customer with a name" do
    customer = create(:customer)

    get "/api/v1/customers/find?name=#{customer[:name]}"

    expect(json_body["id"]).to eq(customer[:id])
    expect(json_body["name"]).to eq(customer[:name])
  end

  xit "returns a customer with a created_at" do
    customer = create(:customer)

    get "/api/v1/customers/find?created_at=#{customer[:created_at]}"

    expect(json_body["id"]).to eq(customer[:id])
    expect(json_body["name"]).to eq(customer[:name])
  end

  xit "returns a customer with an updated_at" do
    customer = create(:customer)

    get "/api/v1/customers/find?updated_at=#{customer[:updated_at]}"

    expect(json_body["id"]).to eq(customer[:id])
    expect(json_body["name"]).to eq(customer[:name])
  end
end
