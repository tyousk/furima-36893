class BuyRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_record_address = BuyRecordAddress.new

  end

  def create
    @item = Item.find(params[:item_id])
    @buy_record_address = BuyRecordAddress.new(buy_record_params)
    if @buy_record_address.valid?
      pay_item
      @buy_record_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:buy_record_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end