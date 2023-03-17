FactoryBot.define do
  factory :vendor do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    online {true}
  end
end

# FactoryBot.create(:vendor)     #在資料庫裡面建立一筆資料,會直接存進資料庫
# FactoryBot.build(:vendor)      

