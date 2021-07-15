class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipality, :address, :building_name, :phone_number, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end
  validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end
