FactoryBot.define do
  factory :order_address do
    token             { 'tk_abab01010101010101010101cdcd' }
    first_name        { Gimei.name.first.hiragana }
    last_name         { Gimei.name.last.kanji }
    postal_code	      { '111-2222' }
    state_province_id { Faker::Number.between(from: 2, to: 48) }
    city              { Gimei.unique.address.city.kanji }
    address_line_1    { Gimei.town.kanji }
    address_line_2    { 'マンション' }
    phone_number      { Faker::Number.leading_zero_number(digits: 11) }
  end
end
