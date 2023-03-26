FactoryBot.define do
  factory :sku do
    # product { nil }
    spec { Faker::Name.name }
    quantity { Faker::Number.between(from: 1, to: 10) }
    # deleted_at { "2023-03-06 14:15:52" }

    product
  end
end
