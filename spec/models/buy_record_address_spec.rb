require 'rails_helper'

RSpec.describe BuyRecordAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_record_address = FactoryBot.build(:buy_record_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入がうまくいくとき' do
      it '全ての必須項目が入力されていれば登録できる' do
        expect(@buy_record_address).to be_valid
      end

      it '「建物名」は空でも登録できる' do
        @buy_record_address.building_name = ''
        expect(@buy_record_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '「郵便番号」が空だと登録できない' do
        @buy_record_address.postal_code = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '「郵便番号」が「3桁ハイフン4桁」の半角文字列でないとと登録できない' do
        @buy_record_address.postal_code = '1122345'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '「都道府県」が空だと登録できない' do
        @buy_record_address.prefecture_id = '1'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '「市区町村」が空だと登録できない' do
        @buy_record_address.city = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("City can't be blank")
      end
      it '「電話番号」が空だと登録できない' do
        @buy_record_address.phone_number = ''
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it '「電話番号」が10桁以上11桁以内でないと登録できない' do
        @buy_record_address.phone_number = '123123123123'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '「電話番号」が半角数字でないと登録できない' do
        @buy_record_address.phone_number = '123-123-123'
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @buy_record_address.token = nil
        @buy_record_address.valid?
        expect(@buy_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
