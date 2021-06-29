class Item < ApplicationRecord

  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :category_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :product_status_id, presence: true
  validates :shipment_source_id, presence: true
  validates :user, presence: true
  validates :shipping_time_id, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/, } do
    validates :price, numericality: { only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  has_one :purchase
  belongs_to :user
  has_one_attached :image

end