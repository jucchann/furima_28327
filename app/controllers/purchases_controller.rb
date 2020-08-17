class PurchasesController < ApplicationController
  before_action :move_to_sign_in
  before_action :move_to_root

  def index
    @purchase = PurchaseDeliveryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:token, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

end
