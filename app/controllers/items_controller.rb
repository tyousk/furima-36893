class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :about, :category_id, :statues_id, :fee_id, :prefecture_id, :send_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
