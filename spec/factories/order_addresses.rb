FactoryBot.define do
  factory :order_address do
    token {"0123456789"}
    postal_code   {"123-4567"}
    prefecture_id {"1"}
    city          {"大阪"}
    house_number  {"1-2-3"}
    building      {}
    phone_number  {"0123456789"}
    association :item
    association :user
  end
end
