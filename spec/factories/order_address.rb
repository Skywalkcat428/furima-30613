FactoryBot.define do
  factory :order_address do
    post_code     { "123-1234" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
    order_id      { Faker::Internet.free_email }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
