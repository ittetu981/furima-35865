## usersテーブル

|Column                  |Type  |Options                 |
|------------------------|------|------------------------|
|email                   |string|null:false, unique: true|
|encrypted_password      |string|null:false              |
|full-width_name         |string|null:false              |
|full-width_katakana_name|string|null:false              |
|nickname                |string|null:false              |
|birthday                |string|null:false              |
|password                |string|null:false              |

### Association

- has many :items
- has many :purchases

## itemsテーブル

|Column                 |Type   |Options                      |
|-----------------------|-------|-----------------------------|
|product_name           |string |null:false                   |
|description_of_item    |text   |null:false                   |
|category_id            |integer|null:false                   |
|product_status_id      |integer|null:false                   |
|delivery_charge_id     |integer|null:false                   |
|shipment_source_id     |integer|null:false                   |
|price                  |integer|null:false                   |
|seller_name            |string |null:false, foreign_key: true|
|shipping_charges       |string |null:false                   |

### Association

- has_one :shipping_address
- belongs_to :user

## purchaseテーブル

|Column                 |Type  |Options                      |
|-----------------------|------|-----------------------------|
|buyer_name             |string|null:false, foreign_key: true|
|purchase_history       |string|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :shipping_address
- belongs_to :item


## shipping_addressテーブル

|Column                 |Type   |Options                 |
|-----------------------|-------|------------------------|
|postal_code            |string |null:false              |
|shipment_source_id     |integer|null:false              |
|municipality           |string |null:false              |
|shipping_days          |string |null:false              |
|address                |string |null:false              |
|building_name          |string |null                    |
|phone_number           |string |null:false              |

### Association

- belongs_to :purchase