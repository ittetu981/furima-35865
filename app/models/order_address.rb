class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipality, :address, :building_name, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\d{10,11}/, }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :shipment_source_id, numericality: { other_than: 1, }
  validates :phone_number, numericality: { only_integer: true }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
