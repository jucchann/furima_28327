class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id,
                                 :delivery_fee_id, :delivery_from_id, :delivery_days_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to user_session_path unless user_signed_in?
  end
end
