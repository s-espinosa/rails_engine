require 'rails_helper'

RSpec.describe "GET /api/v1/customers/random" do
  it "returns a random customer" do
    customer1, customer2 = create_list(:customer, 2)

    get "/api/v1/customers/random"

    expect(["2", "3"]).to include(json_body["last_name"])
  end
end
