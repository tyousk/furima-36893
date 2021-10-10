FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '00000a' }
    password_confirmation { '00000a' }
    first_name            { 'テスト' }
    last_name             { 'テスト' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birth_day             { '2000-01-01' }
  end
end
