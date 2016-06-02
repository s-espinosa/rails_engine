require 'rails_helper'

RSpec.describe "GET /api/v1/items/most_items?quantity=x" do
  it "returns the top x item instances ranked by total number sold" do
    item1, item2, item3 = create_list(:item, 3)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice_item1 = create(:invoice_item, item_id: item1.id, quantity: 2, invoice_id: invoice1.id)
    invoice_item2 = create(:invoice_item, item_id: item1.id, quantity: 2, invoice_id: invoice1.id)
    invoice_item3 = create(:invoice_item, item_id: item2.id, quantity: 2, invoice_id: invoice2.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/items/most_items?quantity=2"

    expect(json_body.count).to eq(2)
    first_transaction = json_body[0]
  end
end
