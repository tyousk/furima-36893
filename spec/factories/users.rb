FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '000000a' }
    password_confirmation {password}
    first_name            { 'テスト' }
    last_name             { 'テスト' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birth_day             { '2000-01-01' }
  end
end
