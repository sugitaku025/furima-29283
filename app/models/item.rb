class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :sender
  belongs_to_active_hash :sending
end
