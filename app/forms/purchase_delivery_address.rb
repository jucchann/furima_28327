class PurchaseDeliveryAddress

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
