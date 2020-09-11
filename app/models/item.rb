class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :price
    validates :explanation
    validates :category
    validates :condition
    validates :postage
    validates :sender
    validates :sending
  end
  PRICE_REGEX = /\A[\d]+\z/.freeze
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates_format_of :price, with: PRICE_REGEX

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :sender_id
    validates :sending_id
  end

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :sender
  belongs_to_active_hash :sending
end
