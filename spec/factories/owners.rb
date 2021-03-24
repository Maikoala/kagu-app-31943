FactoryBot.define do
  factory :owner do
    account_name          { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gimei = Gimei.name
    first_name            { gimei.first.hiragana }
    last_name             { gimei.last.kanji }
    first_name_kana	      { gimei.first.katakana }
    last_name_kana        { gimei.last.katakana }
    postal_code           { '123-4567' }
    state_province_id     { Faker::Number.between(from: 2, to: 48) }
    city                  { Gimei.unique.address.city.kanji }
    address_line_1        { Gimei.town.kanji }
    address_line_2        { 'マンション' }
    phone_number          { Faker::Number.leading_zero_number(digits: 11) }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2011-12-31') }
  end
end
