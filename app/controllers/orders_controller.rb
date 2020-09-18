class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id ==  @item.user_id
      redirect_to items_path(@item)
    end
    @order = Order.new
  end

  def create
  end
end

private

@item = Item.find(params[:item_id])
if current_user.id ==  @item.user_id
  redirect_to items_path(@item)
end