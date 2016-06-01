FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant#{n}" }
  end

  factory :customer do
    first_name { "Customer" }
    sequence(:last_name) { |n| "#{n}" } 
  end
end
