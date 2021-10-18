class BuyRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_record_address = BuyRecordAddress.new

  end

  def create
    @item = Item.find(params[:item_id])
    @buy_record_address = BuyRecordAddress.new(buy_record_params)
    if @buy_record_address.valid?
      @buy_record_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:buy_record_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)

  end
end