require 'rails_helper'

RSpec.describe "GET /api/v1/invoices/random" do
  it "returns a random invoice" do
    invoice1, invoice2 = create_list(:invoice, 2)

    get "/api/v1/invoices/random"

    expect([invoice1[:id], invoice2[:id]]).to include(json_body["id"])
  end
end
