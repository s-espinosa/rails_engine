FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant#{n}" }
  end

  factory :customer do
    sequence(:name) { |n| "Customer#{n}" }
  end
end
