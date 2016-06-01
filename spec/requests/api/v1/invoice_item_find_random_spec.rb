require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/random" do
  it "returns a random invoice" do
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/random"

    expect([invoice_item1[:id], invoice_item2[:id]]).to include(json_body["id"])
  end
end
