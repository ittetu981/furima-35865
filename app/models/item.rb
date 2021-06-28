class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :category_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :product_status_id, presence: true
  validates :shipment_source_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :shipping_charge_id, presence: true


  has_one :purchase
  belongs_to :user

end
