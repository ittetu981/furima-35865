## usersテーブル

|Column                 |Type  |Options   |
|-----------------------|------|----------|
|email                  |string|null:false|
|encrypted_password     |string|null:false|
|name                   |string|null:false|
|credit caed            |string|null:false|

### Association
- has_many :room_users
- has_many :rooms,through :room_users

