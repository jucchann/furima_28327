class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_days

  validates :image, :name, :description, :price, :category, :condition, :delivery_fee, :delivery_from, :delivery_days, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :delivery_fee_id, :delivery_from_id, :delivery_days_id
  end
end
