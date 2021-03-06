class PurchaseDeliveryAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :street_number,
                :building, :phone_number

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを入れてください' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street_number
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A(0{1}\d{9,10})\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
                           street_number: street_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
