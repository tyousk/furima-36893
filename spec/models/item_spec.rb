require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品登録がうまくいくとき' do
      it '全ての値が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '「画像」が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '「商品名」が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '「商品の説明」が空だと登録できない' do
        @item.about = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("About can't be blank")
      end
      it '「カテゴリー」が空だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '「商品の状態」が空だと登録できない' do
        @item.statues_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Statues must be other than 1')
      end
      it '「配送料の負担」が空だと登録できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end
      it '「発送元の地域」が空だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '「発送までの日数」が空だと登録できない' do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 1')
      end
      it '「値段」が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '「値段」が300未満だと登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '「値段」が9999999を超えると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '「値段」が半角数字でないと登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
