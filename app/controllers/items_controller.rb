class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      return render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      return redirect_to item_path
    else
      return render :edit
    end
  end

  def destroy
    if @item.destroy
      user_signed_in? && current_user == @item.user
      return redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
