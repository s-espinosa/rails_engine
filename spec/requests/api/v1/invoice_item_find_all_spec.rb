require 'rails_helper'

RSpec.describe "GET /api/v1/invoice_items/find_all?parameters=:parameters" do
  it "returns all invoice_items with an invoice_id" do
    invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice_item1.id)
    expect(first_invoice["invoice_id"]).to eq(invoice.id)
  end

  it "returns all invoice_items with an item_id" do
    item = create(:item)
    invoice_item1 = create(:invoice_item, item_id: item.id)
    invoice_item2 = create(:invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/find_all?item_id=#{invoice_item1.item_id}"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice_item1.id)
    expect(first_invoice["item_id"]).to eq(invoice_item1.item_id)
  end

  it "returns all invoice_items with a given quantity" do
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2, quantity: 1)
    invoice_item3 = create(:invoice_item, quantity: 3)

    get "/api/v1/invoice_items/find_all?quantity=1"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice_item1.id)
    expect(first_invoice["quantity"]).to eq(invoice_item1.quantity)
  end

  it "returns all invoice_items with a given unit_price" do
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2, unit_price: 250)
    invoice_item3 = create(:invoice_item, unit_price: 450)

    get "/api/v1/invoice_items/find_all?unit_price=2.50"

    expect(json_body.count).to eq(2)
    first_invoice = json_body[0]
    expect(first_invoice["id"]).to eq(invoice_item1.id)
    expect(first_invoice["unit_price"]).to eq(invoice_item1.unit_price)
  end
end
