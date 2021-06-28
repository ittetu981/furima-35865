class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, } do
    validates :full_width_surname
    validates :full_width_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, } do
    validates :surname_yomigana
    validates :name_yomigana
  end

  validates :birthday, presence: true
  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :items
  has_many :purchases
end
