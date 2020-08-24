FactoryBot.define do
  factory :comment do
    text { 'テストです' }
    association :user
    association :item
  end
end
