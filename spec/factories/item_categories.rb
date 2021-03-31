FactoryBot.define do
  factory :item_category do
    name             { Faker::House.furniture }
    info             { Faker::Lorem.characters(number: 50) }
    category_name_id { Faker::Number.between(from: 2, to: 20) }
    color_id         { Faker::Number.between(from: 2, to: 13) }
    price            { Faker::Number.between(from: 1000, to: 100_000) }
  end
end
