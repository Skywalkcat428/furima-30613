class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
      @order_address.save
      return redirect_to action: :index
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:name_id, :price_id, :delivery_charge_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
  
end
