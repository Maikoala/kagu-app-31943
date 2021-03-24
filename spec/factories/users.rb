FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gimei = Gimei.name
    first_name            { gimei.first.kanji }
    last_name             { gimei.last.kanji }
    first_name_kana       { gimei.first.katakana }
    last_name_kana        { gimei.last.katakana }
    postal_code           { '111-2222' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2011-12-31') }
  end
end
