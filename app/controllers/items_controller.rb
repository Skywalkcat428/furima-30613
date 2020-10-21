class ItemsController < ApplicationController

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:nickname, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, :user)
  end

end
