class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end