class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :furigana_last_name
    validates :furigana_first_name
    validates :birthday
  end

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates_format_of :last_name, :first_name, with: NAME_REGEX

    NAME_REGEX = /\A[ァ-ヴ]+\z/.freeze
    validates_format_of :furigana_last_name, :furigana_first_name, with: NAME_REGEX
    

    has_many :items
end
