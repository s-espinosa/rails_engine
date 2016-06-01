FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant#{n}" }
  end

  factory :customer do
    first_name { "Customer" }
    sequence(:last_name) { |n| "#{n}" }
  end

  factory :item do
    merchant
    sequence(:description) { |n| "Item#{n} description" }
    unit_price { 450 }
    name { "Item" }
  end

  factory :invoice do
    customer
    merchant
    status { "shipped" }
  end

  factory :invoice_item do
    item
    invoice
    quantity { 1 }
    unit_price { item.unit_price }
  end
end
