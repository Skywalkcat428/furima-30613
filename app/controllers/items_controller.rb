class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if item.image.attached? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   current_user.update(item_params)
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, :user).merge(user_id: current_user.id)
  end
end
