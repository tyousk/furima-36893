FactoryBot.define do
  factory :buy_record_address do
    postal_code              { '123-4567' }
    prefecture_id            { '13' }
    city                     { '福岡市' }
    address                  { '1-1-1' }
    building_name            { 'テスト' } 
    phone_number             { '12411111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
