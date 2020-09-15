class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @item = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else 
      render :edit
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

  def set_item
    @item = Item.find(params[:id])
  end
end