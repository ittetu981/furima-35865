class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :delivery_charge_id
  belongs_to :product_status_id
  belongs_to :shipment_source_id
  belongs_to :shipping_time_id

  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :validates, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }

end
