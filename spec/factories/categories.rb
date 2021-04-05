FactoryBot.define do
  factory :category do
    category_name_id { Faker::Number.between(from: 1, to: 20) }
  end
end
