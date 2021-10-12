class ItemsController < ApplicationController

	before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

	def create
		Item.create(item_params)
  end

  private

  def message_params
    params.require(:item).permit(:name, :about, :category_id, :statues_id, :fee_id, :prefecture_id, :send_day_id, :price, :user, :image)
  end
end
