class BuyRecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :token
  end

  def save
    buy_record = BuyRecord.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end
