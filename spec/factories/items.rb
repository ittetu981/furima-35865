FactoryBot.define do
  factory :item do
    product_name             {Faker::Team.name}
    description_of_item      {Faker::Lorem.sentence}
    category_id              {2}
    delivery_charge_id       {2}
    product_status_id        {2}
    shipment_source_id       {2}
    price                    {1000}
    shipping_time_id         {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
