class Article < ApplicationRecord
 


  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :validates, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }

end
