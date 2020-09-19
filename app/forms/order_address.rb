class OrderAddress

  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Adress.create(postal_code: postal_code, )
end