class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute :decimal_price, key: :unit_price

  def decimal_price
    (object.unit_price.to_f / 100).to_s
  end
end
