## usersテーブル

|Column                  |Type  |Options                 |
|------------------------|------|------------------------|
|email                   |string|null:false, unique: true|
|encrypted_password      |string|null:false              |
|full-width_name         |string|null:false              |
|full-width_katakana_name|string|null:false              |
|nickname                |string|null:false              |
|birthday                |string|null:false              |

### Association

- has many :item
- has many :hipping address
- has many :purchase

## itemsテーブル

|Column                 |Type   |Options                      |
|-----------------------|-------|-----------------------------|
|product name           |string |null:false                   |
|description of item    |text   |null:false                   |
|category               |integer|null:false                   |
|product status         |integer|null:false                   |
|delivery charge        |integer|null:false                   |
|shipment source        |integer|null:false                   |
|price                  |integer|null:false                   |
|seller name            |string |null:false, foreign_key: true|
|shipping charges       |string |null:false                   |

### Association

- has_one :shipping address
- belongs_to :user

## purchaseテーブル

|Column                 |Type  |Options                      |
|-----------------------|------|-----------------------------|
|buyer name             |string|null:false, foreign_key: true|
|purchase history       |string|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :shipping address


## shipping addressテーブル

|Column                 |Type  |Options                 |
|-----------------------|------|------------------------|
|postal code            |string|null:false              |
|prefectures            |string|null:false              |
|municipality           |string|null:false              |
|shipping days          |string|null:false              |
|buyer name             |string|null:false              |
|address                |string|null:false              |
|building name          |string|null                    |
|phone number           |string|null:false              |
|comment                |text  |null                    |

### Association

- belongs_to :item