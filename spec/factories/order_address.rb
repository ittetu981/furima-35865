FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    shipment_source_id {2}
    municipality {'函館市'}
    address {'1-1'}
    phone_number {'09012345678'}
    token {'whook_c27f3b87075e749a763b0995da'}
  end
end
