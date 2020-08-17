FactoryBot.define do
  factory :purchase_delivery_address do
    token { 'token' }
    post_code { '111-1111' }
    prefecture_id { 1 }
    city { '横浜市緑区' }
    street_number { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
  end
end
