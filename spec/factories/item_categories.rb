FactoryBot.define do
  factory :item_category do
    name             { Faker::House.furniture }
    info             { Faker::Lorem.characters(number: 50) }
    size             { Faker::Lorem.characters(number: 30) }
    category_name_id { Faker::Number.between(from: 1, to: 20) }
    color_id         { Faker::Number.between(from: 1, to: 12) }
    price            { Faker::Number.between(from: 1000, to: 100_000) }
  end
end
