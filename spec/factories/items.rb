FactoryBot.define do
  factory :item do
    name          { "名前" }
    about         { "説明" }
    price           { "300" }
    category_id       { "2" }
    statues_id        { "2" }
    fee_id            { "2" }
    prefecture_id     { "2" }
    send_day_id       { "2" }
    after(:build) do |item|
      item.image.attach(io: File.open('images/mikan458A9336_TP_V4.jpg'), filename: 'mikan458A9336_TP_V4.jpg', content_type: 'image/jpeg')
    end
    association :user
  end
end
