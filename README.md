## usersテーブル

|Column                  |Type  |Options                 |
|------------------------|------|------------------------|
|email                   |string|null:false, unique: true|
|encrypted_password      |string|null:false              |
|full_width_surname      |string|null:false              |
|surname_yomigana        |string|null:false              |
|name_yomigana           |string|null:false              |
|full_width_name         |string|null:false              |
|nickname                |string|null:false              |
|birthday                |date  |null:false              |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column                 |Type      |Options                      |
|-----------------------|----------|-----------------------------|
|product_name           |string    |null:false                   |
|description_of_item    |text      |null:false                   |
|category_id            |integer   |null:false                   |
|delivery_charge_id     |integer   |null:false                   |
|product_status_id      |integer   |null:false                   |
|shipment_source_id     |integer   |null:false                   |
|price                  |integer   |null:false                   |
|user                   |references|null:false, foreign_key: true|
|shipping_charge_id     |integer   |null:false                   |

### Association

- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column                 |Type      |Options                      |
|-----------------------|----------|-----------------------------|
|user                   |references|null:false, foreign_key: true|
|item                   |references|null:false, foreign_key: true|
### Association

- belongs_to :user
- has_one :shipping_address
- belongs_to :item


## shipping_addressテーブル

|Column                 |Type      |Options                      |
|-----------------------|----------|-----------------------------|
|postal_code            |string    |null:false                   |
|shipment_source_id     |integer   |null:false                   |
|municipality           |string    |null:false                   |
|shipping_day           |string    |null:false                   |
|address                |string    |null:false                   |
|building_name          |string    |                             |
|phone_number           |string    |null:false                   |
|purchase               |references|null:false, foreign_key: true|


### Association

- belongs_to :purchase