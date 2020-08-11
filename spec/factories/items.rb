FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '商品説明' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    delivery_from_id { 2 }
    delivery_days_id { 2 }
    price { 1000 }

    association :user
  end
end
