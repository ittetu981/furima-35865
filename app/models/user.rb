class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :full_width_surname, presence: true
  validates :surname_yomigana, presence: true
  validates :full_width_name, presence: true
  validates :name_yomigana, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true

  has_many :items
  has_many :purchases
end
