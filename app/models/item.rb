class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :description_of_item
    validates :category_id
    validates :delivery_charge_id
    validates :product_status_id
    validates :shipment_source_id
    validates :shipping_time_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :product_status
  belongs_to :shipment_source
  belongs_to :shipping_time

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_charge_id
    validates :product_status_id
    validates :shipment_source_id
    validates :shipping_time_id
  end

end