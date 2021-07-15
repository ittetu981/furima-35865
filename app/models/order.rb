class Order < ApplicationRecord
  attr_accessor :token

  with_options presence: true do
    validates :postal_code
    validates :shipment_source_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end

  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipment_source
end
