FactoryBot.define do
  factory :buy_record_address do
    postal_code              { '123-4567' }
    prefecture_id            { '13' }
    city                     { '福岡市' }
    address                  { '1-1-1' }
    phone_number             { '12411111111' }
  end
end
