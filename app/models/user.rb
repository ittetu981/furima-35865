class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, } do
    validates :full_width_surname
    validates :full_width_name
    validates :surname_yomigana
    validates :name_yomigana
  end
  validates :full_width_surname, presence: true
  validates :surname_yomigana, presence: true
  validates :full_width_name, presence: true
  validates :name_yomigana, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true

  has_many :items
  has_many :purchases
end
