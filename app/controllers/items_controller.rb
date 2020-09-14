class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
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
    params.require(:item).permit(
      :image,
      :name,
      :price,
      :explanation,
      :category_id,
      :condition_id,
      :postage_id,
      :sender_id,
      :sending_id,
    )
    .merge(user_id: current_user.id)
  end
end