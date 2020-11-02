class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])

    unless (user_signed_in? && current_user != @item.user) || '売却済み'
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
