FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name             { '名字' }
    first_name            { '名前' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birth_date            { '2020-01-01' }
  end
end
