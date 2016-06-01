class ItemSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :name, :description
  attribute :decimal_price, key: :unit_price

  def decimal_price
    (object.unit_price.to_f / 100).to_s
  end
end
