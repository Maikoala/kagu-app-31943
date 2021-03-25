FactoryBot.define do
  factory :shop do
    name  { Faker::Lorem.words }
    info  { Faker::Lorem.characters(number: 30) }
  end
end
