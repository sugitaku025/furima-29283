FactoryBot.define do
  factory :item do
    image             {}
    name              {"テスト"}
    price             {"2000"}
    explanation       {"テスト"}
    category_id       {"1"}
    condition_id      {"1"} 
    postage_id        {"1"}
    sender_id         {"1"}
    sending_id        {"1"}
    association :user 
  end
end