FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    
    list_price { Faker::Number.between(from: 10, to: 50) }
    sell_price { Faker::Number.between(from: 1, to: 50) }
    
    on_sell { false }
    
    vendor     #會自己找到對應的vendor
    category

    trait :with_skus do 
      transient do
        amount {2}
      end
      
      skus { build_list :sku, amount}

    end
  end
end

# FactoryBot.create(:product)
# FactoryBot.create(:product, :with_skus, amount: 5)
